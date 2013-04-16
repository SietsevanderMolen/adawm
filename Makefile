all:
	gprbuild -p -Padawm/adawm -o ../../out/adawm

test:
	gprbuild -p -f -Pharness/harness -o out/test_adawm

coverage:
	gprbuild -p -f -Pharness/harness -XCOVERAGE=yes -o out/test_adawm
	./out/test_adawm
	cd harness/obj; gcov ../../adawm/obj/*.gcda

clean:
	gprclean -Padawm/adawm
	gprclean -Pharness/harness
	rm adawm/obj/* -rf
	rm harness/obj/* -rf
	rm out/* -rf
