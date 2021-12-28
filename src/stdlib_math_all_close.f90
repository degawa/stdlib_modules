
submodule (stdlib_math) stdlib_math_all_close

    implicit none
    
contains

    logical pure module function all_close_1_rsp(a, b, rel_tol, abs_tol, equal_nan) result(close)

        real(sp), intent(in) :: a(:), b(:)
        real(sp), intent(in), optional :: rel_tol, abs_tol
        logical, intent(in), optional :: equal_nan

        close = all(is_close(a, b, rel_tol, abs_tol, equal_nan))

    end function all_close_1_rsp
    logical pure module function all_close_2_rsp(a, b, rel_tol, abs_tol, equal_nan) result(close)

        real(sp), intent(in) :: a(:,:), b(:,:)
        real(sp), intent(in), optional :: rel_tol, abs_tol
        logical, intent(in), optional :: equal_nan

        close = all(is_close(a, b, rel_tol, abs_tol, equal_nan))

    end function all_close_2_rsp
    logical pure module function all_close_3_rsp(a, b, rel_tol, abs_tol, equal_nan) result(close)

        real(sp), intent(in) :: a(:,:,:), b(:,:,:)
        real(sp), intent(in), optional :: rel_tol, abs_tol
        logical, intent(in), optional :: equal_nan

        close = all(is_close(a, b, rel_tol, abs_tol, equal_nan))

    end function all_close_3_rsp
    logical pure module function all_close_4_rsp(a, b, rel_tol, abs_tol, equal_nan) result(close)

        real(sp), intent(in) :: a(:,:,:,:), b(:,:,:,:)
        real(sp), intent(in), optional :: rel_tol, abs_tol
        logical, intent(in), optional :: equal_nan

        close = all(is_close(a, b, rel_tol, abs_tol, equal_nan))

    end function all_close_4_rsp
    logical pure module function all_close_1_rdp(a, b, rel_tol, abs_tol, equal_nan) result(close)

        real(dp), intent(in) :: a(:), b(:)
        real(dp), intent(in), optional :: rel_tol, abs_tol
        logical, intent(in), optional :: equal_nan

        close = all(is_close(a, b, rel_tol, abs_tol, equal_nan))

    end function all_close_1_rdp
    logical pure module function all_close_2_rdp(a, b, rel_tol, abs_tol, equal_nan) result(close)

        real(dp), intent(in) :: a(:,:), b(:,:)
        real(dp), intent(in), optional :: rel_tol, abs_tol
        logical, intent(in), optional :: equal_nan

        close = all(is_close(a, b, rel_tol, abs_tol, equal_nan))

    end function all_close_2_rdp
    logical pure module function all_close_3_rdp(a, b, rel_tol, abs_tol, equal_nan) result(close)

        real(dp), intent(in) :: a(:,:,:), b(:,:,:)
        real(dp), intent(in), optional :: rel_tol, abs_tol
        logical, intent(in), optional :: equal_nan

        close = all(is_close(a, b, rel_tol, abs_tol, equal_nan))

    end function all_close_3_rdp
    logical pure module function all_close_4_rdp(a, b, rel_tol, abs_tol, equal_nan) result(close)

        real(dp), intent(in) :: a(:,:,:,:), b(:,:,:,:)
        real(dp), intent(in), optional :: rel_tol, abs_tol
        logical, intent(in), optional :: equal_nan

        close = all(is_close(a, b, rel_tol, abs_tol, equal_nan))

    end function all_close_4_rdp
    logical pure module function all_close_1_rxdp(a, b, rel_tol, abs_tol, equal_nan) result(close)

        real(xdp), intent(in) :: a(:), b(:)
        real(xdp), intent(in), optional :: rel_tol, abs_tol
        logical, intent(in), optional :: equal_nan

        close = all(is_close(a, b, rel_tol, abs_tol, equal_nan))

    end function all_close_1_rxdp
    logical pure module function all_close_2_rxdp(a, b, rel_tol, abs_tol, equal_nan) result(close)

        real(xdp), intent(in) :: a(:,:), b(:,:)
        real(xdp), intent(in), optional :: rel_tol, abs_tol
        logical, intent(in), optional :: equal_nan

        close = all(is_close(a, b, rel_tol, abs_tol, equal_nan))

    end function all_close_2_rxdp
    logical pure module function all_close_3_rxdp(a, b, rel_tol, abs_tol, equal_nan) result(close)

        real(xdp), intent(in) :: a(:,:,:), b(:,:,:)
        real(xdp), intent(in), optional :: rel_tol, abs_tol
        logical, intent(in), optional :: equal_nan

        close = all(is_close(a, b, rel_tol, abs_tol, equal_nan))

    end function all_close_3_rxdp
    logical pure module function all_close_4_rxdp(a, b, rel_tol, abs_tol, equal_nan) result(close)

        real(xdp), intent(in) :: a(:,:,:,:), b(:,:,:,:)
        real(xdp), intent(in), optional :: rel_tol, abs_tol
        logical, intent(in), optional :: equal_nan

        close = all(is_close(a, b, rel_tol, abs_tol, equal_nan))

    end function all_close_4_rxdp
    logical pure module function all_close_1_rqp(a, b, rel_tol, abs_tol, equal_nan) result(close)

        real(qp), intent(in) :: a(:), b(:)
        real(qp), intent(in), optional :: rel_tol, abs_tol
        logical, intent(in), optional :: equal_nan

        close = all(is_close(a, b, rel_tol, abs_tol, equal_nan))

    end function all_close_1_rqp
    logical pure module function all_close_2_rqp(a, b, rel_tol, abs_tol, equal_nan) result(close)

        real(qp), intent(in) :: a(:,:), b(:,:)
        real(qp), intent(in), optional :: rel_tol, abs_tol
        logical, intent(in), optional :: equal_nan

        close = all(is_close(a, b, rel_tol, abs_tol, equal_nan))

    end function all_close_2_rqp
    logical pure module function all_close_3_rqp(a, b, rel_tol, abs_tol, equal_nan) result(close)

        real(qp), intent(in) :: a(:,:,:), b(:,:,:)
        real(qp), intent(in), optional :: rel_tol, abs_tol
        logical, intent(in), optional :: equal_nan

        close = all(is_close(a, b, rel_tol, abs_tol, equal_nan))

    end function all_close_3_rqp
    logical pure module function all_close_4_rqp(a, b, rel_tol, abs_tol, equal_nan) result(close)

        real(qp), intent(in) :: a(:,:,:,:), b(:,:,:,:)
        real(qp), intent(in), optional :: rel_tol, abs_tol
        logical, intent(in), optional :: equal_nan

        close = all(is_close(a, b, rel_tol, abs_tol, equal_nan))

    end function all_close_4_rqp
    logical pure module function all_close_1_csp(a, b, rel_tol, abs_tol, equal_nan) result(close)

        complex(sp), intent(in) :: a(:), b(:)
        real(sp), intent(in), optional :: rel_tol, abs_tol
        logical, intent(in), optional :: equal_nan

        close = all(is_close(a, b, rel_tol, abs_tol, equal_nan))

    end function all_close_1_csp
    logical pure module function all_close_2_csp(a, b, rel_tol, abs_tol, equal_nan) result(close)

        complex(sp), intent(in) :: a(:,:), b(:,:)
        real(sp), intent(in), optional :: rel_tol, abs_tol
        logical, intent(in), optional :: equal_nan

        close = all(is_close(a, b, rel_tol, abs_tol, equal_nan))

    end function all_close_2_csp
    logical pure module function all_close_3_csp(a, b, rel_tol, abs_tol, equal_nan) result(close)

        complex(sp), intent(in) :: a(:,:,:), b(:,:,:)
        real(sp), intent(in), optional :: rel_tol, abs_tol
        logical, intent(in), optional :: equal_nan

        close = all(is_close(a, b, rel_tol, abs_tol, equal_nan))

    end function all_close_3_csp
    logical pure module function all_close_4_csp(a, b, rel_tol, abs_tol, equal_nan) result(close)

        complex(sp), intent(in) :: a(:,:,:,:), b(:,:,:,:)
        real(sp), intent(in), optional :: rel_tol, abs_tol
        logical, intent(in), optional :: equal_nan

        close = all(is_close(a, b, rel_tol, abs_tol, equal_nan))

    end function all_close_4_csp
    logical pure module function all_close_1_cdp(a, b, rel_tol, abs_tol, equal_nan) result(close)

        complex(dp), intent(in) :: a(:), b(:)
        real(dp), intent(in), optional :: rel_tol, abs_tol
        logical, intent(in), optional :: equal_nan

        close = all(is_close(a, b, rel_tol, abs_tol, equal_nan))

    end function all_close_1_cdp
    logical pure module function all_close_2_cdp(a, b, rel_tol, abs_tol, equal_nan) result(close)

        complex(dp), intent(in) :: a(:,:), b(:,:)
        real(dp), intent(in), optional :: rel_tol, abs_tol
        logical, intent(in), optional :: equal_nan

        close = all(is_close(a, b, rel_tol, abs_tol, equal_nan))

    end function all_close_2_cdp
    logical pure module function all_close_3_cdp(a, b, rel_tol, abs_tol, equal_nan) result(close)

        complex(dp), intent(in) :: a(:,:,:), b(:,:,:)
        real(dp), intent(in), optional :: rel_tol, abs_tol
        logical, intent(in), optional :: equal_nan

        close = all(is_close(a, b, rel_tol, abs_tol, equal_nan))

    end function all_close_3_cdp
    logical pure module function all_close_4_cdp(a, b, rel_tol, abs_tol, equal_nan) result(close)

        complex(dp), intent(in) :: a(:,:,:,:), b(:,:,:,:)
        real(dp), intent(in), optional :: rel_tol, abs_tol
        logical, intent(in), optional :: equal_nan

        close = all(is_close(a, b, rel_tol, abs_tol, equal_nan))

    end function all_close_4_cdp
    logical pure module function all_close_1_cxdp(a, b, rel_tol, abs_tol, equal_nan) result(close)

        complex(xdp), intent(in) :: a(:), b(:)
        real(xdp), intent(in), optional :: rel_tol, abs_tol
        logical, intent(in), optional :: equal_nan

        close = all(is_close(a, b, rel_tol, abs_tol, equal_nan))

    end function all_close_1_cxdp
    logical pure module function all_close_2_cxdp(a, b, rel_tol, abs_tol, equal_nan) result(close)

        complex(xdp), intent(in) :: a(:,:), b(:,:)
        real(xdp), intent(in), optional :: rel_tol, abs_tol
        logical, intent(in), optional :: equal_nan

        close = all(is_close(a, b, rel_tol, abs_tol, equal_nan))

    end function all_close_2_cxdp
    logical pure module function all_close_3_cxdp(a, b, rel_tol, abs_tol, equal_nan) result(close)

        complex(xdp), intent(in) :: a(:,:,:), b(:,:,:)
        real(xdp), intent(in), optional :: rel_tol, abs_tol
        logical, intent(in), optional :: equal_nan

        close = all(is_close(a, b, rel_tol, abs_tol, equal_nan))

    end function all_close_3_cxdp
    logical pure module function all_close_4_cxdp(a, b, rel_tol, abs_tol, equal_nan) result(close)

        complex(xdp), intent(in) :: a(:,:,:,:), b(:,:,:,:)
        real(xdp), intent(in), optional :: rel_tol, abs_tol
        logical, intent(in), optional :: equal_nan

        close = all(is_close(a, b, rel_tol, abs_tol, equal_nan))

    end function all_close_4_cxdp
    logical pure module function all_close_1_cqp(a, b, rel_tol, abs_tol, equal_nan) result(close)

        complex(qp), intent(in) :: a(:), b(:)
        real(qp), intent(in), optional :: rel_tol, abs_tol
        logical, intent(in), optional :: equal_nan

        close = all(is_close(a, b, rel_tol, abs_tol, equal_nan))

    end function all_close_1_cqp
    logical pure module function all_close_2_cqp(a, b, rel_tol, abs_tol, equal_nan) result(close)

        complex(qp), intent(in) :: a(:,:), b(:,:)
        real(qp), intent(in), optional :: rel_tol, abs_tol
        logical, intent(in), optional :: equal_nan

        close = all(is_close(a, b, rel_tol, abs_tol, equal_nan))

    end function all_close_2_cqp
    logical pure module function all_close_3_cqp(a, b, rel_tol, abs_tol, equal_nan) result(close)

        complex(qp), intent(in) :: a(:,:,:), b(:,:,:)
        real(qp), intent(in), optional :: rel_tol, abs_tol
        logical, intent(in), optional :: equal_nan

        close = all(is_close(a, b, rel_tol, abs_tol, equal_nan))

    end function all_close_3_cqp
    logical pure module function all_close_4_cqp(a, b, rel_tol, abs_tol, equal_nan) result(close)

        complex(qp), intent(in) :: a(:,:,:,:), b(:,:,:,:)
        real(qp), intent(in), optional :: rel_tol, abs_tol
        logical, intent(in), optional :: equal_nan

        close = all(is_close(a, b, rel_tol, abs_tol, equal_nan))

    end function all_close_4_cqp

end submodule stdlib_math_all_close