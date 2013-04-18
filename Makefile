all:
	gprbuild -p -Padawm/adawm

test:
	gprbuild -p -f -Pharness/harness

coverage:
	gprbuild -p -f -Pharness/harness -XCOVERAGE=yes
	./out/test_adawm
	cd harness/obj; gcov ../../adawm/obj/*.gcda

clean:
	gprclean -Padawm/adawm
	gprclean -Pharness/harness
	rm adawm/obj/* -rf
	rm harness/obj/* -rf
	rm out/* -rf
