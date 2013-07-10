all:
	gprbuild -p -Padawm/adawm

test:
	gprbuild -p -f -Ptests/tests

coverage:
	gprbuild -p -f -Ptests/tests -XCOVERAGE=yes
	./out/test_adawm
	cd tests/obj; gcov ../../adawm/obj/*.gcda

clean:
	gprclean -Padawm/adawm
	gprclean -Ptests/tests
	rm adawm/obj/* -rf
	rm tests/obj/* -rf
	rm out/* -rf
