module test_kinds

    use testdrive, only: new_unittest, unittest_type, error_type, check
    use kinds_mod
    implicit none

contains

    subroutine collect_kinds(testsuite)

        type(unittest_type), allocatable, intent(out) :: testsuite(:)

        testsuite = [ &
                    new_unittest("print_type vaild", test_kinds_print_type), &
                    new_unittest("local vaild", test_kinds_local) &
                    ]

    end subroutine collect_kinds

    subroutine test_kinds_print_type(error)

        type(error_type), allocatable, intent(out) :: error

        call printTypes

    end subroutine test_kinds_print_type

    subroutine test_kinds_local(error)

        type(error_type), allocatable, intent(out) :: error

        call check(error, PI, 3.141592653589793_wp)
        if (allocated(error)) return

        call check(error, E, 2.718281828459045_wp)
        if (allocated(error)) return

        call check(error, wp, 8)

    end subroutine test_kinds_local

end module test_kinds
