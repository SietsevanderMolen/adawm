with Ada.Containers.Doubly_Linked_Lists;
with Ada.Strings.Unbounded;

with Rectangles;
with xab_types;

--  A 'Con' represents everything from the X11 root window down to a single X11
--  window.
package Cons is
   type Con_Type is
      (CT_ROOT, CT_OUTPUT, CT_CON, CT_FLOATING_CON, CT_WORKSPACE);
   type Fullscreen_Mode_Type is (CF_NONE, CF_OUTPUT, CF_GLOBAL);

   --  layout is the layout of this container: one of split[v|h], stacked
   --  or tabbed. Special containers in the tree (above workspaces) have
   --  special layouts like dockarea or output.

   --  last_split_layout is one of splitv or splith to support the old
   --  "layout default" command which by now should be "layout splitv" or
   --  "layout splith" explicitly.

   --  workspace_layout is only for type == CT_WORKSPACE cons. When you
   --  change the layout of a workspace without any children, i3 cannot
   --  just set the layout (because workspaces need to be splitv/splith
   --  to allow focus parent and opening new containers). Instead, it
   --  stores the requested layout in workspace_layout and creates a new
   --  split container with that layout whenever a new container is
   --  attached to the workspace.
   type Layout_Type is (L_DEFAULT, L_STACKED, L_TABBED, L_DOCKAREA, L_OUTPUT,
      L_SPLITV, L_SPLITH);

   --  floating? (= not in tiling layout) This cannot be simply a bool because
   --  we want to keep track of whether the status was set by the application
   --  (by setting _NET_WM_WINDOW_TYPE appropriately) or by the user. The
   --  user’s choice overwrites automatic mode, of course. The order of the
   --  values is important because we check with >= FLOATING_AUTO_ON if a
   --  client is floating. (ADAWM addition: bullshit, we are not going to do
   --  that.)
   type Floating_Mode is (FLOATING_AUTO_OFF, FLOATING_USER_OFF,
                          FLOATING_AUTO_ON, FLOATING_USER_ON);

   type Con;
   type Con_Access is access Con;

   package Con_List is new Ada.Containers.Doubly_Linked_Lists (Con_Access);
   --  package Match_List is new Ada.Containers.Doubly_Linked_Lists (Match);

   type Con is tagged
      record
         Mapped : Boolean;
         CType  : Con_Type;
         Parent : Con_Access;

         Rect        : Rectangles.Rectangle;
         Window_Rect : Rectangles.Rectangle;
         Deco_Rect   : Rectangles.Rectangle;
         --  The geometry this window requested when getting mapped
         Geometry    : Rectangles.Rectangle;

         Name : Ada.Strings.Unbounded.Unbounded_String;

         --  The workspace number, if this Con is of type CT_WORKSPACE and the
         --  workspace is not a named workspace --  (for named workspaces, Number == -1)
         Number : Natural;

         --  Proportional width/height, calculated from WM_NORMAL_HINTS, used
         --  to apply an aspect ratio to windows (think of MPlayer)
         Proportional_Width  : Natural;
         Proportional_Height : Natural;
         --  The wanted size of the window, used in combination with size
         --  increments (see below)
         Base_Width  : Natural;
         Base_Height : Natural;

         --  The x11 border pixel attribute
         Border_Width         : Natural;
         Current_Border_Width : Natural;

         --  Minimum increment size specified for the window (in pixels)
         Width_Increment  : Positive;
         Height_Increment : Positive;

         --  Window : Types.Window; TODO

         --  Should this container be marked urgent? This gets set when the
         --  window inside this container (if any) sets the urgency hint, for
         --  example.
         Urgent : Boolean;

         --  Timer used for disabling urgency
         --  struct ev_timer *urgency_timer;

         --  Ids/pixmap/graphics context for the frame window
         Frame            : xab_types.xab_window_t;
         Pixmap           : xab_types.xab_pixmap_t;
         Pixmap_GContext  : xab_types.xab_gcontext_t;
         Pixmap_Recreated : Boolean;

         --  Cache for the decoration rendering
         --  struct deco_render_params *deco_render_params; TODO

         --  Only workspace-containers can have floating clients
         Nodes            : Con_List.List;
         Focused          : Con_List.List;
         All_Cons         : Con_List.List;
         Floating_Windows : Con_List.List;
         --  Swallow  : Match_List.List;

         Fullscreen_Mode : Fullscreen_Mode_Type;

         Layout            : Layout_Type;
         Last_Split_Layout : Layout_Type;
         Workspace_Layout  : Layout_Type;

         --  border_style_t border_style; TODO

         Floating : Floating_Mode;

         --  This counter contains the number of UnmapNotify events for this
         --  container (or, more precisely, for its ->frame) which should be
         --  ignored.  UnmapNotify events need to be ignored when they are
         --  caused by i3 itself, for example when reparenting or when
         --  unmapping the window on a workspace change.
         Ignore_Unmap : Natural;

         --  --  callbacks
         --  void(*on_remove_child)(Con *);

         --  enum {
         --  --  Not a scratchpad window
         --  SCRATCHPAD_NONE = 0,

         --  --  Just moved to scratchpad, not resized by the user yet
         --  --  Window will be auto-centered and sized appropriately
         --  SCRATCHPAD_FRESH = 1,

         --  --  The user changed position/size of the scratchpad window
         --  SCRATCHPAD_CHANGED = 2
         --  } scratchpad_state;

         --  The ID of this container before restarting. Necessary to correctly
         --  interpret back-references in the JSON (such as the focus stack)
         --  int old_id;
      end record;

   --  Create a new container
   --  This function initializes the data structures and creates the right
   --  X11 IDs using x_con_init().
   function Create return Con;

   --  Create a new container, and attach it to the given parent.
   --  This function initializes the data structures and creates the right
   --  X11 IDs using x_con_init().
   function Create (parent : Con) return Con;

   --  Attaches the given container to the given parent. This happens when
   --  moving a container or when inserting a new container at a specific place
   --  in the tree.
   --  ignore_focus is to just insert the Con at the end (useful when creating
   --  a new split container *around* some containers, that is, detaching and
   --  attaching them in order without wanting to mess with the focus in
   --  between).
   function Attach_To (C            : Con;
                       Parent       : Con;
                       Ignore_Focus : Boolean)
                      return Con;
end Cons;
