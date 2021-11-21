program main

    use, intrinsic :: iso_fortran_env, only: stderr => error_unit
    use testdrive, only: run_testsuite, new_testsuite, testsuite_type
    use test_kinds
    implicit none

    type(testsuite_type), allocatable :: testsuites(:)
    character(len=*), parameter :: fmt = '("#", *(1x, a))'
    integer :: stat, i

    testsuites = [ &
                 new_testsuite("test kinds", collect_kinds) &
                 ]

    do i = 1, size(testsuites)
        write (stderr, fmt) "Testing: ", testsuites(i)%name
        call run_testsuite(testsuites(i)%collect, stderr, stat)
    end do

    if (stat > 0) then
        write (stderr, '(i0, 1x, a)') stat, "test(s) failed!"
        error stop
    end if
    
end program main
