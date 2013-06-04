package Layout_Types is
   --  workspace_layout is only for type == CT_WORKSPACE cons. When you
   --  change the layout of a workspace without any children, i3 cannot
   --  just set the layout (because workspaces need to be splitv/splith
   --  to allow focus parent and opening new containers). Instead, it
   --  stores the requested layout in workspace_layout and creates a new
   --  split container with that layout whenever a new container is
   --  attached to the workspace.
   type Layout_Type is (L_DEFAULT, L_STACKED, L_TABBED, L_DOCKAREA, L_OUTPUT,
      L_SPLITV, L_SPLITH);
end Layout_Types;
