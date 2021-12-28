submodule (stdlib_stats) stdlib_stats_moment

  use, intrinsic:: ieee_arithmetic, only: ieee_value, ieee_quiet_nan
  use stdlib_error, only: error_stop
  use stdlib_optval, only: optval
  implicit none

contains

      module function moment_1_rsp_rsp(x, order, dim, center, mask) result(res)
        real(sp), intent(in) :: x(:)
        integer, intent(in) :: order
        integer, intent(in) :: dim
        real(sp), intent(in), optional :: center
        logical, intent(in), optional :: mask
        real(sp) :: res

        integer :: i
        real(sp) :: n
        real(sp), allocatable :: mean_

        if (.not.optval(mask, .true.)) then
          res = ieee_value(1._sp, ieee_quiet_nan)
          return
        end if

        n = real(size(x, dim), sp)

        res = 0
        select case(dim)
          case(1)
            if (present(center)) then
              do i = 1, size(x, 1)
                res = res + (x(i) - center)**order
              end do
            else
              allocate(mean_, source = mean(x, 1))
              do i = 1, size(x, 1)
                res = res + (x(i) - mean_)**order
              end do
              deallocate(mean_)
            end if
          case default
            call error_stop("ERROR (moment): wrong dimension")
        end select
        res = res / n

      end function moment_1_rsp_rsp
      module function moment_2_rsp_rsp(x, order, dim, center, mask) result(res)
        real(sp), intent(in) :: x(:,:)
        integer, intent(in) :: order
        integer, intent(in) :: dim
        real(sp), intent(in), optional :: center(merge(size(x, 1), size(x, 2), mask=1<dim))
        logical, intent(in), optional :: mask
        real(sp) :: res(merge(size(x, 1), size(x, 2), mask=1<dim))

        integer :: i
        real(sp) :: n
        real(sp), allocatable :: mean_(:)

        if (.not.optval(mask, .true.)) then
          res = ieee_value(1._sp, ieee_quiet_nan)
          return
        end if

        n = real(size(x, dim), sp)

        res = 0
        select case(dim)
          case(1)
            if (present(center)) then
              do i = 1, size(x, 1)
                res = res + (x(i, :) - center)**order
              end do
            else
              allocate(mean_, source = mean(x, 1))
              do i = 1, size(x, 1)
                res = res + (x(i, :) - mean_)**order
              end do
              deallocate(mean_)
            end if
          case(2)
            if (present(center)) then
              do i = 1, size(x, 2)
                res = res + (x(:, i) - center)**order
              end do
            else
              allocate(mean_, source = mean(x, 2))
              do i = 1, size(x, 2)
                res = res + (x(:, i) - mean_)**order
              end do
              deallocate(mean_)
            end if
          case default
            call error_stop("ERROR (moment): wrong dimension")
        end select
        res = res / n

      end function moment_2_rsp_rsp
      module function moment_3_rsp_rsp(x, order, dim, center, mask) result(res)
        real(sp), intent(in) :: x(:,:,:)
        integer, intent(in) :: order
        integer, intent(in) :: dim
        real(sp), intent(in), optional :: center(merge(size(x, 1), size(x, 2), mask=1<dim), merge(size(x, 2), size(x, 3),&
            & mask=2<dim))
        logical, intent(in), optional :: mask
        real(sp) :: res(merge(size(x, 1), size(x, 2), mask=1<dim), merge(size(x, 2), size(x, 3), mask=2<dim))

        integer :: i
        real(sp) :: n
        real(sp), allocatable :: mean_(:,:)

        if (.not.optval(mask, .true.)) then
          res = ieee_value(1._sp, ieee_quiet_nan)
          return
        end if

        n = real(size(x, dim), sp)

        res = 0
        select case(dim)
          case(1)
            if (present(center)) then
              do i = 1, size(x, 1)
                res = res + (x(i, :, :) - center)**order
              end do
            else
              allocate(mean_, source = mean(x, 1))
              do i = 1, size(x, 1)
                res = res + (x(i, :, :) - mean_)**order
              end do
              deallocate(mean_)
            end if
          case(2)
            if (present(center)) then
              do i = 1, size(x, 2)
                res = res + (x(:, i, :) - center)**order
              end do
            else
              allocate(mean_, source = mean(x, 2))
              do i = 1, size(x, 2)
                res = res + (x(:, i, :) - mean_)**order
              end do
              deallocate(mean_)
            end if
          case(3)
            if (present(center)) then
              do i = 1, size(x, 3)
                res = res + (x(:, :, i) - center)**order
              end do
            else
              allocate(mean_, source = mean(x, 3))
              do i = 1, size(x, 3)
                res = res + (x(:, :, i) - mean_)**order
              end do
              deallocate(mean_)
            end if
          case default
            call error_stop("ERROR (moment): wrong dimension")
        end select
        res = res / n

      end function moment_3_rsp_rsp
      module function moment_4_rsp_rsp(x, order, dim, center, mask) result(res)
        real(sp), intent(in) :: x(:,:,:,:)
        integer, intent(in) :: order
        integer, intent(in) :: dim
        real(sp), intent(in), optional :: center(merge(size(x, 1), size(x, 2), mask=1<dim), merge(size(x, 2), size(x, 3),&
            & mask=2<dim), merge(size(x, 3), size(x, 4), mask=3<dim))
        logical, intent(in), optional :: mask
        real(sp) :: res(merge(size(x, 1), size(x, 2), mask=1<dim), merge(size(x, 2), size(x, 3), mask=2<dim), merge(size(x, 3),&
            & size(x, 4), mask=3<dim))

        integer :: i
        real(sp) :: n
        real(sp), allocatable :: mean_(:,:,:)

        if (.not.optval(mask, .true.)) then
          res = ieee_value(1._sp, ieee_quiet_nan)
          return
        end if

        n = real(size(x, dim), sp)

        res = 0
        select case(dim)
          case(1)
            if (present(center)) then
              do i = 1, size(x, 1)
                res = res + (x(i, :, :, :) - center)**order
              end do
            else
              allocate(mean_, source = mean(x, 1))
              do i = 1, size(x, 1)
                res = res + (x(i, :, :, :) - mean_)**order
              end do
              deallocate(mean_)
            end if
          case(2)
            if (present(center)) then
              do i = 1, size(x, 2)
                res = res + (x(:, i, :, :) - center)**order
              end do
            else
              allocate(mean_, source = mean(x, 2))
              do i = 1, size(x, 2)
                res = res + (x(:, i, :, :) - mean_)**order
              end do
              deallocate(mean_)
            end if
          case(3)
            if (present(center)) then
              do i = 1, size(x, 3)
                res = res + (x(:, :, i, :) - center)**order
              end do
            else
              allocate(mean_, source = mean(x, 3))
              do i = 1, size(x, 3)
                res = res + (x(:, :, i, :) - mean_)**order
              end do
              deallocate(mean_)
            end if
          case(4)
            if (present(center)) then
              do i = 1, size(x, 4)
                res = res + (x(:, :, :, i) - center)**order
              end do
            else
              allocate(mean_, source = mean(x, 4))
              do i = 1, size(x, 4)
                res = res + (x(:, :, :, i) - mean_)**order
              end do
              deallocate(mean_)
            end if
          case default
            call error_stop("ERROR (moment): wrong dimension")
        end select
        res = res / n

      end function moment_4_rsp_rsp
      module function moment_1_rdp_rdp(x, order, dim, center, mask) result(res)
        real(dp), intent(in) :: x(:)
        integer, intent(in) :: order
        integer, intent(in) :: dim
        real(dp), intent(in), optional :: center
        logical, intent(in), optional :: mask
        real(dp) :: res

        integer :: i
        real(dp) :: n
        real(dp), allocatable :: mean_

        if (.not.optval(mask, .true.)) then
          res = ieee_value(1._dp, ieee_quiet_nan)
          return
        end if

        n = real(size(x, dim), dp)

        res = 0
        select case(dim)
          case(1)
            if (present(center)) then
              do i = 1, size(x, 1)
                res = res + (x(i) - center)**order
              end do
            else
              allocate(mean_, source = mean(x, 1))
              do i = 1, size(x, 1)
                res = res + (x(i) - mean_)**order
              end do
              deallocate(mean_)
            end if
          case default
            call error_stop("ERROR (moment): wrong dimension")
        end select
        res = res / n

      end function moment_1_rdp_rdp
      module function moment_2_rdp_rdp(x, order, dim, center, mask) result(res)
        real(dp), intent(in) :: x(:,:)
        integer, intent(in) :: order
        integer, intent(in) :: dim
        real(dp), intent(in), optional :: center(merge(size(x, 1), size(x, 2), mask=1<dim))
        logical, intent(in), optional :: mask
        real(dp) :: res(merge(size(x, 1), size(x, 2), mask=1<dim))

        integer :: i
        real(dp) :: n
        real(dp), allocatable :: mean_(:)

        if (.not.optval(mask, .true.)) then
          res = ieee_value(1._dp, ieee_quiet_nan)
          return
        end if

        n = real(size(x, dim), dp)

        res = 0
        select case(dim)
          case(1)
            if (present(center)) then
              do i = 1, size(x, 1)
                res = res + (x(i, :) - center)**order
              end do
            else
              allocate(mean_, source = mean(x, 1))
              do i = 1, size(x, 1)
                res = res + (x(i, :) - mean_)**order
              end do
              deallocate(mean_)
            end if
          case(2)
            if (present(center)) then
              do i = 1, size(x, 2)
                res = res + (x(:, i) - center)**order
              end do
            else
              allocate(mean_, source = mean(x, 2))
              do i = 1, size(x, 2)
                res = res + (x(:, i) - mean_)**order
              end do
              deallocate(mean_)
            end if
          case default
            call error_stop("ERROR (moment): wrong dimension")
        end select
        res = res / n

      end function moment_2_rdp_rdp
      module function moment_3_rdp_rdp(x, order, dim, center, mask) result(res)
        real(dp), intent(in) :: x(:,:,:)
        integer, intent(in) :: order
        integer, intent(in) :: dim
        real(dp), intent(in), optional :: center(merge(size(x, 1), size(x, 2), mask=1<dim), merge(size(x, 2), size(x, 3),&
            & mask=2<dim))
        logical, intent(in), optional :: mask
        real(dp) :: res(merge(size(x, 1), size(x, 2), mask=1<dim), merge(size(x, 2), size(x, 3), mask=2<dim))

        integer :: i
        real(dp) :: n
        real(dp), allocatable :: mean_(:,:)

        if (.not.optval(mask, .true.)) then
          res = ieee_value(1._dp, ieee_quiet_nan)
          return
        end if

        n = real(size(x, dim), dp)

        res = 0
        select case(dim)
          case(1)
            if (present(center)) then
              do i = 1, size(x, 1)
                res = res + (x(i, :, :) - center)**order
              end do
            else
              allocate(mean_, source = mean(x, 1))
              do i = 1, size(x, 1)
                res = res + (x(i, :, :) - mean_)**order
              end do
              deallocate(mean_)
            end if
          case(2)
            if (present(center)) then
              do i = 1, size(x, 2)
                res = res + (x(:, i, :) - center)**order
              end do
            else
              allocate(mean_, source = mean(x, 2))
              do i = 1, size(x, 2)
                res = res + (x(:, i, :) - mean_)**order
              end do
              deallocate(mean_)
            end if
          case(3)
            if (present(center)) then
              do i = 1, size(x, 3)
                res = res + (x(:, :, i) - center)**order
              end do
            else
              allocate(mean_, source = mean(x, 3))
              do i = 1, size(x, 3)
                res = res + (x(:, :, i) - mean_)**order
              end do
              deallocate(mean_)
            end if
          case default
            call error_stop("ERROR (moment): wrong dimension")
        end select
        res = res / n

      end function moment_3_rdp_rdp
      module function moment_4_rdp_rdp(x, order, dim, center, mask) result(res)
        real(dp), intent(in) :: x(:,:,:,:)
        integer, intent(in) :: order
        integer, intent(in) :: dim
        real(dp), intent(in), optional :: center(merge(size(x, 1), size(x, 2), mask=1<dim), merge(size(x, 2), size(x, 3),&
            & mask=2<dim), merge(size(x, 3), size(x, 4), mask=3<dim))
        logical, intent(in), optional :: mask
        real(dp) :: res(merge(size(x, 1), size(x, 2), mask=1<dim), merge(size(x, 2), size(x, 3), mask=2<dim), merge(size(x, 3),&
            & size(x, 4), mask=3<dim))

        integer :: i
        real(dp) :: n
        real(dp), allocatable :: mean_(:,:,:)

        if (.not.optval(mask, .true.)) then
          res = ieee_value(1._dp, ieee_quiet_nan)
          return
        end if

        n = real(size(x, dim), dp)

        res = 0
        select case(dim)
          case(1)
            if (present(center)) then
              do i = 1, size(x, 1)
                res = res + (x(i, :, :, :) - center)**order
              end do
            else
              allocate(mean_, source = mean(x, 1))
              do i = 1, size(x, 1)
                res = res + (x(i, :, :, :) - mean_)**order
              end do
              deallocate(mean_)
            end if
          case(2)
            if (present(center)) then
              do i = 1, size(x, 2)
                res = res + (x(:, i, :, :) - center)**order
              end do
            else
              allocate(mean_, source = mean(x, 2))
              do i = 1, size(x, 2)
                res = res + (x(:, i, :, :) - mean_)**order
              end do
              deallocate(mean_)
            end if
          case(3)
            if (present(center)) then
              do i = 1, size(x, 3)
                res = res + (x(:, :, i, :) - center)**order
              end do
            else
              allocate(mean_, source = mean(x, 3))
              do i = 1, size(x, 3)
                res = res + (x(:, :, i, :) - mean_)**order
              end do
              deallocate(mean_)
            end if
          case(4)
            if (present(center)) then
              do i = 1, size(x, 4)
                res = res + (x(:, :, :, i) - center)**order
              end do
            else
              allocate(mean_, source = mean(x, 4))
              do i = 1, size(x, 4)
                res = res + (x(:, :, :, i) - mean_)**order
              end do
              deallocate(mean_)
            end if
          case default
            call error_stop("ERROR (moment): wrong dimension")
        end select
        res = res / n

      end function moment_4_rdp_rdp
      module function moment_1_rxdp_rxdp(x, order, dim, center, mask) result(res)
        real(xdp), intent(in) :: x(:)
        integer, intent(in) :: order
        integer, intent(in) :: dim
        real(xdp), intent(in), optional :: center
        logical, intent(in), optional :: mask
        real(xdp) :: res

        integer :: i
        real(xdp) :: n
        real(xdp), allocatable :: mean_

        if (.not.optval(mask, .true.)) then
          res = ieee_value(1._xdp, ieee_quiet_nan)
          return
        end if

        n = real(size(x, dim), xdp)

        res = 0
        select case(dim)
          case(1)
            if (present(center)) then
              do i = 1, size(x, 1)
                res = res + (x(i) - center)**order
              end do
            else
              allocate(mean_, source = mean(x, 1))
              do i = 1, size(x, 1)
                res = res + (x(i) - mean_)**order
              end do
              deallocate(mean_)
            end if
          case default
            call error_stop("ERROR (moment): wrong dimension")
        end select
        res = res / n

      end function moment_1_rxdp_rxdp
      module function moment_2_rxdp_rxdp(x, order, dim, center, mask) result(res)
        real(xdp), intent(in) :: x(:,:)
        integer, intent(in) :: order
        integer, intent(in) :: dim
        real(xdp), intent(in), optional :: center(merge(size(x, 1), size(x, 2), mask=1<dim))
        logical, intent(in), optional :: mask
        real(xdp) :: res(merge(size(x, 1), size(x, 2), mask=1<dim))

        integer :: i
        real(xdp) :: n
        real(xdp), allocatable :: mean_(:)

        if (.not.optval(mask, .true.)) then
          res = ieee_value(1._xdp, ieee_quiet_nan)
          return
        end if

        n = real(size(x, dim), xdp)

        res = 0
        select case(dim)
          case(1)
            if (present(center)) then
              do i = 1, size(x, 1)
                res = res + (x(i, :) - center)**order
              end do
            else
              allocate(mean_, source = mean(x, 1))
              do i = 1, size(x, 1)
                res = res + (x(i, :) - mean_)**order
              end do
              deallocate(mean_)
            end if
          case(2)
            if (present(center)) then
              do i = 1, size(x, 2)
                res = res + (x(:, i) - center)**order
              end do
            else
              allocate(mean_, source = mean(x, 2))
              do i = 1, size(x, 2)
                res = res + (x(:, i) - mean_)**order
              end do
              deallocate(mean_)
            end if
          case default
            call error_stop("ERROR (moment): wrong dimension")
        end select
        res = res / n

      end function moment_2_rxdp_rxdp
      module function moment_3_rxdp_rxdp(x, order, dim, center, mask) result(res)
        real(xdp), intent(in) :: x(:,:,:)
        integer, intent(in) :: order
        integer, intent(in) :: dim
        real(xdp), intent(in), optional :: center(merge(size(x, 1), size(x, 2), mask=1<dim), merge(size(x, 2), size(x, 3),&
            & mask=2<dim))
        logical, intent(in), optional :: mask
        real(xdp) :: res(merge(size(x, 1), size(x, 2), mask=1<dim), merge(size(x, 2), size(x, 3), mask=2<dim))

        integer :: i
        real(xdp) :: n
        real(xdp), allocatable :: mean_(:,:)

        if (.not.optval(mask, .true.)) then
          res = ieee_value(1._xdp, ieee_quiet_nan)
          return
        end if

        n = real(size(x, dim), xdp)

        res = 0
        select case(dim)
          case(1)
            if (present(center)) then
              do i = 1, size(x, 1)
                res = res + (x(i, :, :) - center)**order
              end do
            else
              allocate(mean_, source = mean(x, 1))
              do i = 1, size(x, 1)
                res = res + (x(i, :, :) - mean_)**order
              end do
              deallocate(mean_)
            end if
          case(2)
            if (present(center)) then
              do i = 1, size(x, 2)
                res = res + (x(:, i, :) - center)**order
              end do
            else
              allocate(mean_, source = mean(x, 2))
              do i = 1, size(x, 2)
                res = res + (x(:, i, :) - mean_)**order
              end do
              deallocate(mean_)
            end if
          case(3)
            if (present(center)) then
              do i = 1, size(x, 3)
                res = res + (x(:, :, i) - center)**order
              end do
            else
              allocate(mean_, source = mean(x, 3))
              do i = 1, size(x, 3)
                res = res + (x(:, :, i) - mean_)**order
              end do
              deallocate(mean_)
            end if
          case default
            call error_stop("ERROR (moment): wrong dimension")
        end select
        res = res / n

      end function moment_3_rxdp_rxdp
      module function moment_4_rxdp_rxdp(x, order, dim, center, mask) result(res)
        real(xdp), intent(in) :: x(:,:,:,:)
        integer, intent(in) :: order
        integer, intent(in) :: dim
        real(xdp), intent(in), optional :: center(merge(size(x, 1), size(x, 2), mask=1<dim), merge(size(x, 2), size(x, 3),&
            & mask=2<dim), merge(size(x, 3), size(x, 4), mask=3<dim))
        logical, intent(in), optional :: mask
        real(xdp) :: res(merge(size(x, 1), size(x, 2), mask=1<dim), merge(size(x, 2), size(x, 3), mask=2<dim), merge(size(x, 3),&
            & size(x, 4), mask=3<dim))

        integer :: i
        real(xdp) :: n
        real(xdp), allocatable :: mean_(:,:,:)

        if (.not.optval(mask, .true.)) then
          res = ieee_value(1._xdp, ieee_quiet_nan)
          return
        end if

        n = real(size(x, dim), xdp)

        res = 0
        select case(dim)
          case(1)
            if (present(center)) then
              do i = 1, size(x, 1)
                res = res + (x(i, :, :, :) - center)**order
              end do
            else
              allocate(mean_, source = mean(x, 1))
              do i = 1, size(x, 1)
                res = res + (x(i, :, :, :) - mean_)**order
              end do
              deallocate(mean_)
            end if
          case(2)
            if (present(center)) then
              do i = 1, size(x, 2)
                res = res + (x(:, i, :, :) - center)**order
              end do
            else
              allocate(mean_, source = mean(x, 2))
              do i = 1, size(x, 2)
                res = res + (x(:, i, :, :) - mean_)**order
              end do
              deallocate(mean_)
            end if
          case(3)
            if (present(center)) then
              do i = 1, size(x, 3)
                res = res + (x(:, :, i, :) - center)**order
              end do
            else
              allocate(mean_, source = mean(x, 3))
              do i = 1, size(x, 3)
                res = res + (x(:, :, i, :) - mean_)**order
              end do
              deallocate(mean_)
            end if
          case(4)
            if (present(center)) then
              do i = 1, size(x, 4)
                res = res + (x(:, :, :, i) - center)**order
              end do
            else
              allocate(mean_, source = mean(x, 4))
              do i = 1, size(x, 4)
                res = res + (x(:, :, :, i) - mean_)**order
              end do
              deallocate(mean_)
            end if
          case default
            call error_stop("ERROR (moment): wrong dimension")
        end select
        res = res / n

      end function moment_4_rxdp_rxdp
      module function moment_1_rqp_rqp(x, order, dim, center, mask) result(res)
        real(qp), intent(in) :: x(:)
        integer, intent(in) :: order
        integer, intent(in) :: dim
        real(qp), intent(in), optional :: center
        logical, intent(in), optional :: mask
        real(qp) :: res

        integer :: i
        real(qp) :: n
        real(qp), allocatable :: mean_

        if (.not.optval(mask, .true.)) then
          res = ieee_value(1._qp, ieee_quiet_nan)
          return
        end if

        n = real(size(x, dim), qp)

        res = 0
        select case(dim)
          case(1)
            if (present(center)) then
              do i = 1, size(x, 1)
                res = res + (x(i) - center)**order
              end do
            else
              allocate(mean_, source = mean(x, 1))
              do i = 1, size(x, 1)
                res = res + (x(i) - mean_)**order
              end do
              deallocate(mean_)
            end if
          case default
            call error_stop("ERROR (moment): wrong dimension")
        end select
        res = res / n

      end function moment_1_rqp_rqp
      module function moment_2_rqp_rqp(x, order, dim, center, mask) result(res)
        real(qp), intent(in) :: x(:,:)
        integer, intent(in) :: order
        integer, intent(in) :: dim
        real(qp), intent(in), optional :: center(merge(size(x, 1), size(x, 2), mask=1<dim))
        logical, intent(in), optional :: mask
        real(qp) :: res(merge(size(x, 1), size(x, 2), mask=1<dim))

        integer :: i
        real(qp) :: n
        real(qp), allocatable :: mean_(:)

        if (.not.optval(mask, .true.)) then
          res = ieee_value(1._qp, ieee_quiet_nan)
          return
        end if

        n = real(size(x, dim), qp)

        res = 0
        select case(dim)
          case(1)
            if (present(center)) then
              do i = 1, size(x, 1)
                res = res + (x(i, :) - center)**order
              end do
            else
              allocate(mean_, source = mean(x, 1))
              do i = 1, size(x, 1)
                res = res + (x(i, :) - mean_)**order
              end do
              deallocate(mean_)
            end if
          case(2)
            if (present(center)) then
              do i = 1, size(x, 2)
                res = res + (x(:, i) - center)**order
              end do
            else
              allocate(mean_, source = mean(x, 2))
              do i = 1, size(x, 2)
                res = res + (x(:, i) - mean_)**order
              end do
              deallocate(mean_)
            end if
          case default
            call error_stop("ERROR (moment): wrong dimension")
        end select
        res = res / n

      end function moment_2_rqp_rqp
      module function moment_3_rqp_rqp(x, order, dim, center, mask) result(res)
        real(qp), intent(in) :: x(:,:,:)
        integer, intent(in) :: order
        integer, intent(in) :: dim
        real(qp), intent(in), optional :: center(merge(size(x, 1), size(x, 2), mask=1<dim), merge(size(x, 2), size(x, 3),&
            & mask=2<dim))
        logical, intent(in), optional :: mask
        real(qp) :: res(merge(size(x, 1), size(x, 2), mask=1<dim), merge(size(x, 2), size(x, 3), mask=2<dim))

        integer :: i
        real(qp) :: n
        real(qp), allocatable :: mean_(:,:)

        if (.not.optval(mask, .true.)) then
          res = ieee_value(1._qp, ieee_quiet_nan)
          return
        end if

        n = real(size(x, dim), qp)

        res = 0
        select case(dim)
          case(1)
            if (present(center)) then
              do i = 1, size(x, 1)
                res = res + (x(i, :, :) - center)**order
              end do
            else
              allocate(mean_, source = mean(x, 1))
              do i = 1, size(x, 1)
                res = res + (x(i, :, :) - mean_)**order
              end do
              deallocate(mean_)
            end if
          case(2)
            if (present(center)) then
              do i = 1, size(x, 2)
                res = res + (x(:, i, :) - center)**order
              end do
            else
              allocate(mean_, source = mean(x, 2))
              do i = 1, size(x, 2)
                res = res + (x(:, i, :) - mean_)**order
              end do
              deallocate(mean_)
            end if
          case(3)
            if (present(center)) then
              do i = 1, size(x, 3)
                res = res + (x(:, :, i) - center)**order
              end do
            else
              allocate(mean_, source = mean(x, 3))
              do i = 1, size(x, 3)
                res = res + (x(:, :, i) - mean_)**order
              end do
              deallocate(mean_)
            end if
          case default
            call error_stop("ERROR (moment): wrong dimension")
        end select
        res = res / n

      end function moment_3_rqp_rqp
      module function moment_4_rqp_rqp(x, order, dim, center, mask) result(res)
        real(qp), intent(in) :: x(:,:,:,:)
        integer, intent(in) :: order
        integer, intent(in) :: dim
        real(qp), intent(in), optional :: center(merge(size(x, 1), size(x, 2), mask=1<dim), merge(size(x, 2), size(x, 3),&
            & mask=2<dim), merge(size(x, 3), size(x, 4), mask=3<dim))
        logical, intent(in), optional :: mask
        real(qp) :: res(merge(size(x, 1), size(x, 2), mask=1<dim), merge(size(x, 2), size(x, 3), mask=2<dim), merge(size(x, 3),&
            & size(x, 4), mask=3<dim))

        integer :: i
        real(qp) :: n
        real(qp), allocatable :: mean_(:,:,:)

        if (.not.optval(mask, .true.)) then
          res = ieee_value(1._qp, ieee_quiet_nan)
          return
        end if

        n = real(size(x, dim), qp)

        res = 0
        select case(dim)
          case(1)
            if (present(center)) then
              do i = 1, size(x, 1)
                res = res + (x(i, :, :, :) - center)**order
              end do
            else
              allocate(mean_, source = mean(x, 1))
              do i = 1, size(x, 1)
                res = res + (x(i, :, :, :) - mean_)**order
              end do
              deallocate(mean_)
            end if
          case(2)
            if (present(center)) then
              do i = 1, size(x, 2)
                res = res + (x(:, i, :, :) - center)**order
              end do
            else
              allocate(mean_, source = mean(x, 2))
              do i = 1, size(x, 2)
                res = res + (x(:, i, :, :) - mean_)**order
              end do
              deallocate(mean_)
            end if
          case(3)
            if (present(center)) then
              do i = 1, size(x, 3)
                res = res + (x(:, :, i, :) - center)**order
              end do
            else
              allocate(mean_, source = mean(x, 3))
              do i = 1, size(x, 3)
                res = res + (x(:, :, i, :) - mean_)**order
              end do
              deallocate(mean_)
            end if
          case(4)
            if (present(center)) then
              do i = 1, size(x, 4)
                res = res + (x(:, :, :, i) - center)**order
              end do
            else
              allocate(mean_, source = mean(x, 4))
              do i = 1, size(x, 4)
                res = res + (x(:, :, :, i) - mean_)**order
              end do
              deallocate(mean_)
            end if
          case default
            call error_stop("ERROR (moment): wrong dimension")
        end select
        res = res / n

      end function moment_4_rqp_rqp
      module function moment_1_csp_csp(x, order, dim, center, mask) result(res)
        complex(sp), intent(in) :: x(:)
        integer, intent(in) :: order
        integer, intent(in) :: dim
        complex(sp), intent(in), optional :: center
        logical, intent(in), optional :: mask
        complex(sp) :: res

        integer :: i
        real(sp) :: n
        complex(sp), allocatable :: mean_

        if (.not.optval(mask, .true.)) then
          res = ieee_value(1._sp, ieee_quiet_nan)
          return
        end if

        n = real(size(x, dim), sp)

        res = 0
        select case(dim)
          case(1)
            if (present(center)) then
              do i = 1, size(x, 1)
                res = res + (x(i) - center)**order
              end do
            else
              allocate(mean_, source = mean(x, 1))
              do i = 1, size(x, 1)
                res = res + (x(i) - mean_)**order
              end do
              deallocate(mean_)
            end if
          case default
            call error_stop("ERROR (moment): wrong dimension")
        end select
        res = res / n

      end function moment_1_csp_csp
      module function moment_2_csp_csp(x, order, dim, center, mask) result(res)
        complex(sp), intent(in) :: x(:,:)
        integer, intent(in) :: order
        integer, intent(in) :: dim
        complex(sp), intent(in), optional :: center(merge(size(x, 1), size(x, 2), mask=1<dim))
        logical, intent(in), optional :: mask
        complex(sp) :: res(merge(size(x, 1), size(x, 2), mask=1<dim))

        integer :: i
        real(sp) :: n
        complex(sp), allocatable :: mean_(:)

        if (.not.optval(mask, .true.)) then
          res = ieee_value(1._sp, ieee_quiet_nan)
          return
        end if

        n = real(size(x, dim), sp)

        res = 0
        select case(dim)
          case(1)
            if (present(center)) then
              do i = 1, size(x, 1)
                res = res + (x(i, :) - center)**order
              end do
            else
              allocate(mean_, source = mean(x, 1))
              do i = 1, size(x, 1)
                res = res + (x(i, :) - mean_)**order
              end do
              deallocate(mean_)
            end if
          case(2)
            if (present(center)) then
              do i = 1, size(x, 2)
                res = res + (x(:, i) - center)**order
              end do
            else
              allocate(mean_, source = mean(x, 2))
              do i = 1, size(x, 2)
                res = res + (x(:, i) - mean_)**order
              end do
              deallocate(mean_)
            end if
          case default
            call error_stop("ERROR (moment): wrong dimension")
        end select
        res = res / n

      end function moment_2_csp_csp
      module function moment_3_csp_csp(x, order, dim, center, mask) result(res)
        complex(sp), intent(in) :: x(:,:,:)
        integer, intent(in) :: order
        integer, intent(in) :: dim
        complex(sp), intent(in), optional :: center(merge(size(x, 1), size(x, 2), mask=1<dim), merge(size(x, 2), size(x, 3),&
            & mask=2<dim))
        logical, intent(in), optional :: mask
        complex(sp) :: res(merge(size(x, 1), size(x, 2), mask=1<dim), merge(size(x, 2), size(x, 3), mask=2<dim))

        integer :: i
        real(sp) :: n
        complex(sp), allocatable :: mean_(:,:)

        if (.not.optval(mask, .true.)) then
          res = ieee_value(1._sp, ieee_quiet_nan)
          return
        end if

        n = real(size(x, dim), sp)

        res = 0
        select case(dim)
          case(1)
            if (present(center)) then
              do i = 1, size(x, 1)
                res = res + (x(i, :, :) - center)**order
              end do
            else
              allocate(mean_, source = mean(x, 1))
              do i = 1, size(x, 1)
                res = res + (x(i, :, :) - mean_)**order
              end do
              deallocate(mean_)
            end if
          case(2)
            if (present(center)) then
              do i = 1, size(x, 2)
                res = res + (x(:, i, :) - center)**order
              end do
            else
              allocate(mean_, source = mean(x, 2))
              do i = 1, size(x, 2)
                res = res + (x(:, i, :) - mean_)**order
              end do
              deallocate(mean_)
            end if
          case(3)
            if (present(center)) then
              do i = 1, size(x, 3)
                res = res + (x(:, :, i) - center)**order
              end do
            else
              allocate(mean_, source = mean(x, 3))
              do i = 1, size(x, 3)
                res = res + (x(:, :, i) - mean_)**order
              end do
              deallocate(mean_)
            end if
          case default
            call error_stop("ERROR (moment): wrong dimension")
        end select
        res = res / n

      end function moment_3_csp_csp
      module function moment_4_csp_csp(x, order, dim, center, mask) result(res)
        complex(sp), intent(in) :: x(:,:,:,:)
        integer, intent(in) :: order
        integer, intent(in) :: dim
        complex(sp), intent(in), optional :: center(merge(size(x, 1), size(x, 2), mask=1<dim), merge(size(x, 2), size(x, 3),&
            & mask=2<dim), merge(size(x, 3), size(x, 4), mask=3<dim))
        logical, intent(in), optional :: mask
        complex(sp) :: res(merge(size(x, 1), size(x, 2), mask=1<dim), merge(size(x, 2), size(x, 3), mask=2<dim), merge(size(x, 3),&
            & size(x, 4), mask=3<dim))

        integer :: i
        real(sp) :: n
        complex(sp), allocatable :: mean_(:,:,:)

        if (.not.optval(mask, .true.)) then
          res = ieee_value(1._sp, ieee_quiet_nan)
          return
        end if

        n = real(size(x, dim), sp)

        res = 0
        select case(dim)
          case(1)
            if (present(center)) then
              do i = 1, size(x, 1)
                res = res + (x(i, :, :, :) - center)**order
              end do
            else
              allocate(mean_, source = mean(x, 1))
              do i = 1, size(x, 1)
                res = res + (x(i, :, :, :) - mean_)**order
              end do
              deallocate(mean_)
            end if
          case(2)
            if (present(center)) then
              do i = 1, size(x, 2)
                res = res + (x(:, i, :, :) - center)**order
              end do
            else
              allocate(mean_, source = mean(x, 2))
              do i = 1, size(x, 2)
                res = res + (x(:, i, :, :) - mean_)**order
              end do
              deallocate(mean_)
            end if
          case(3)
            if (present(center)) then
              do i = 1, size(x, 3)
                res = res + (x(:, :, i, :) - center)**order
              end do
            else
              allocate(mean_, source = mean(x, 3))
              do i = 1, size(x, 3)
                res = res + (x(:, :, i, :) - mean_)**order
              end do
              deallocate(mean_)
            end if
          case(4)
            if (present(center)) then
              do i = 1, size(x, 4)
                res = res + (x(:, :, :, i) - center)**order
              end do
            else
              allocate(mean_, source = mean(x, 4))
              do i = 1, size(x, 4)
                res = res + (x(:, :, :, i) - mean_)**order
              end do
              deallocate(mean_)
            end if
          case default
            call error_stop("ERROR (moment): wrong dimension")
        end select
        res = res / n

      end function moment_4_csp_csp
      module function moment_1_cdp_cdp(x, order, dim, center, mask) result(res)
        complex(dp), intent(in) :: x(:)
        integer, intent(in) :: order
        integer, intent(in) :: dim
        complex(dp), intent(in), optional :: center
        logical, intent(in), optional :: mask
        complex(dp) :: res

        integer :: i
        real(dp) :: n
        complex(dp), allocatable :: mean_

        if (.not.optval(mask, .true.)) then
          res = ieee_value(1._dp, ieee_quiet_nan)
          return
        end if

        n = real(size(x, dim), dp)

        res = 0
        select case(dim)
          case(1)
            if (present(center)) then
              do i = 1, size(x, 1)
                res = res + (x(i) - center)**order
              end do
            else
              allocate(mean_, source = mean(x, 1))
              do i = 1, size(x, 1)
                res = res + (x(i) - mean_)**order
              end do
              deallocate(mean_)
            end if
          case default
            call error_stop("ERROR (moment): wrong dimension")
        end select
        res = res / n

      end function moment_1_cdp_cdp
      module function moment_2_cdp_cdp(x, order, dim, center, mask) result(res)
        complex(dp), intent(in) :: x(:,:)
        integer, intent(in) :: order
        integer, intent(in) :: dim
        complex(dp), intent(in), optional :: center(merge(size(x, 1), size(x, 2), mask=1<dim))
        logical, intent(in), optional :: mask
        complex(dp) :: res(merge(size(x, 1), size(x, 2), mask=1<dim))

        integer :: i
        real(dp) :: n
        complex(dp), allocatable :: mean_(:)

        if (.not.optval(mask, .true.)) then
          res = ieee_value(1._dp, ieee_quiet_nan)
          return
        end if

        n = real(size(x, dim), dp)

        res = 0
        select case(dim)
          case(1)
            if (present(center)) then
              do i = 1, size(x, 1)
                res = res + (x(i, :) - center)**order
              end do
            else
              allocate(mean_, source = mean(x, 1))
              do i = 1, size(x, 1)
                res = res + (x(i, :) - mean_)**order
              end do
              deallocate(mean_)
            end if
          case(2)
            if (present(center)) then
              do i = 1, size(x, 2)
                res = res + (x(:, i) - center)**order
              end do
            else
              allocate(mean_, source = mean(x, 2))
              do i = 1, size(x, 2)
                res = res + (x(:, i) - mean_)**order
              end do
              deallocate(mean_)
            end if
          case default
            call error_stop("ERROR (moment): wrong dimension")
        end select
        res = res / n

      end function moment_2_cdp_cdp
      module function moment_3_cdp_cdp(x, order, dim, center, mask) result(res)
        complex(dp), intent(in) :: x(:,:,:)
        integer, intent(in) :: order
        integer, intent(in) :: dim
        complex(dp), intent(in), optional :: center(merge(size(x, 1), size(x, 2), mask=1<dim), merge(size(x, 2), size(x, 3),&
            & mask=2<dim))
        logical, intent(in), optional :: mask
        complex(dp) :: res(merge(size(x, 1), size(x, 2), mask=1<dim), merge(size(x, 2), size(x, 3), mask=2<dim))

        integer :: i
        real(dp) :: n
        complex(dp), allocatable :: mean_(:,:)

        if (.not.optval(mask, .true.)) then
          res = ieee_value(1._dp, ieee_quiet_nan)
          return
        end if

        n = real(size(x, dim), dp)

        res = 0
        select case(dim)
          case(1)
            if (present(center)) then
              do i = 1, size(x, 1)
                res = res + (x(i, :, :) - center)**order
              end do
            else
              allocate(mean_, source = mean(x, 1))
              do i = 1, size(x, 1)
                res = res + (x(i, :, :) - mean_)**order
              end do
              deallocate(mean_)
            end if
          case(2)
            if (present(center)) then
              do i = 1, size(x, 2)
                res = res + (x(:, i, :) - center)**order
              end do
            else
              allocate(mean_, source = mean(x, 2))
              do i = 1, size(x, 2)
                res = res + (x(:, i, :) - mean_)**order
              end do
              deallocate(mean_)
            end if
          case(3)
            if (present(center)) then
              do i = 1, size(x, 3)
                res = res + (x(:, :, i) - center)**order
              end do
            else
              allocate(mean_, source = mean(x, 3))
              do i = 1, size(x, 3)
                res = res + (x(:, :, i) - mean_)**order
              end do
              deallocate(mean_)
            end if
          case default
            call error_stop("ERROR (moment): wrong dimension")
        end select
        res = res / n

      end function moment_3_cdp_cdp
      module function moment_4_cdp_cdp(x, order, dim, center, mask) result(res)
        complex(dp), intent(in) :: x(:,:,:,:)
        integer, intent(in) :: order
        integer, intent(in) :: dim
        complex(dp), intent(in), optional :: center(merge(size(x, 1), size(x, 2), mask=1<dim), merge(size(x, 2), size(x, 3),&
            & mask=2<dim), merge(size(x, 3), size(x, 4), mask=3<dim))
        logical, intent(in), optional :: mask
        complex(dp) :: res(merge(size(x, 1), size(x, 2), mask=1<dim), merge(size(x, 2), size(x, 3), mask=2<dim), merge(size(x, 3),&
            & size(x, 4), mask=3<dim))

        integer :: i
        real(dp) :: n
        complex(dp), allocatable :: mean_(:,:,:)

        if (.not.optval(mask, .true.)) then
          res = ieee_value(1._dp, ieee_quiet_nan)
          return
        end if

        n = real(size(x, dim), dp)

        res = 0
        select case(dim)
          case(1)
            if (present(center)) then
              do i = 1, size(x, 1)
                res = res + (x(i, :, :, :) - center)**order
              end do
            else
              allocate(mean_, source = mean(x, 1))
              do i = 1, size(x, 1)
                res = res + (x(i, :, :, :) - mean_)**order
              end do
              deallocate(mean_)
            end if
          case(2)
            if (present(center)) then
              do i = 1, size(x, 2)
                res = res + (x(:, i, :, :) - center)**order
              end do
            else
              allocate(mean_, source = mean(x, 2))
              do i = 1, size(x, 2)
                res = res + (x(:, i, :, :) - mean_)**order
              end do
              deallocate(mean_)
            end if
          case(3)
            if (present(center)) then
              do i = 1, size(x, 3)
                res = res + (x(:, :, i, :) - center)**order
              end do
            else
              allocate(mean_, source = mean(x, 3))
              do i = 1, size(x, 3)
                res = res + (x(:, :, i, :) - mean_)**order
              end do
              deallocate(mean_)
            end if
          case(4)
            if (present(center)) then
              do i = 1, size(x, 4)
                res = res + (x(:, :, :, i) - center)**order
              end do
            else
              allocate(mean_, source = mean(x, 4))
              do i = 1, size(x, 4)
                res = res + (x(:, :, :, i) - mean_)**order
              end do
              deallocate(mean_)
            end if
          case default
            call error_stop("ERROR (moment): wrong dimension")
        end select
        res = res / n

      end function moment_4_cdp_cdp
      module function moment_1_cxdp_cxdp(x, order, dim, center, mask) result(res)
        complex(xdp), intent(in) :: x(:)
        integer, intent(in) :: order
        integer, intent(in) :: dim
        complex(xdp), intent(in), optional :: center
        logical, intent(in), optional :: mask
        complex(xdp) :: res

        integer :: i
        real(xdp) :: n
        complex(xdp), allocatable :: mean_

        if (.not.optval(mask, .true.)) then
          res = ieee_value(1._xdp, ieee_quiet_nan)
          return
        end if

        n = real(size(x, dim), xdp)

        res = 0
        select case(dim)
          case(1)
            if (present(center)) then
              do i = 1, size(x, 1)
                res = res + (x(i) - center)**order
              end do
            else
              allocate(mean_, source = mean(x, 1))
              do i = 1, size(x, 1)
                res = res + (x(i) - mean_)**order
              end do
              deallocate(mean_)
            end if
          case default
            call error_stop("ERROR (moment): wrong dimension")
        end select
        res = res / n

      end function moment_1_cxdp_cxdp
      module function moment_2_cxdp_cxdp(x, order, dim, center, mask) result(res)
        complex(xdp), intent(in) :: x(:,:)
        integer, intent(in) :: order
        integer, intent(in) :: dim
        complex(xdp), intent(in), optional :: center(merge(size(x, 1), size(x, 2), mask=1<dim))
        logical, intent(in), optional :: mask
        complex(xdp) :: res(merge(size(x, 1), size(x, 2), mask=1<dim))

        integer :: i
        real(xdp) :: n
        complex(xdp), allocatable :: mean_(:)

        if (.not.optval(mask, .true.)) then
          res = ieee_value(1._xdp, ieee_quiet_nan)
          return
        end if

        n = real(size(x, dim), xdp)

        res = 0
        select case(dim)
          case(1)
            if (present(center)) then
              do i = 1, size(x, 1)
                res = res + (x(i, :) - center)**order
              end do
            else
              allocate(mean_, source = mean(x, 1))
              do i = 1, size(x, 1)
                res = res + (x(i, :) - mean_)**order
              end do
              deallocate(mean_)
            end if
          case(2)
            if (present(center)) then
              do i = 1, size(x, 2)
                res = res + (x(:, i) - center)**order
              end do
            else
              allocate(mean_, source = mean(x, 2))
              do i = 1, size(x, 2)
                res = res + (x(:, i) - mean_)**order
              end do
              deallocate(mean_)
            end if
          case default
            call error_stop("ERROR (moment): wrong dimension")
        end select
        res = res / n

      end function moment_2_cxdp_cxdp
      module function moment_3_cxdp_cxdp(x, order, dim, center, mask) result(res)
        complex(xdp), intent(in) :: x(:,:,:)
        integer, intent(in) :: order
        integer, intent(in) :: dim
        complex(xdp), intent(in), optional :: center(merge(size(x, 1), size(x, 2), mask=1<dim), merge(size(x, 2), size(x, 3),&
            & mask=2<dim))
        logical, intent(in), optional :: mask
        complex(xdp) :: res(merge(size(x, 1), size(x, 2), mask=1<dim), merge(size(x, 2), size(x, 3), mask=2<dim))

        integer :: i
        real(xdp) :: n
        complex(xdp), allocatable :: mean_(:,:)

        if (.not.optval(mask, .true.)) then
          res = ieee_value(1._xdp, ieee_quiet_nan)
          return
        end if

        n = real(size(x, dim), xdp)

        res = 0
        select case(dim)
          case(1)
            if (present(center)) then
              do i = 1, size(x, 1)
                res = res + (x(i, :, :) - center)**order
              end do
            else
              allocate(mean_, source = mean(x, 1))
              do i = 1, size(x, 1)
                res = res + (x(i, :, :) - mean_)**order
              end do
              deallocate(mean_)
            end if
          case(2)
            if (present(center)) then
              do i = 1, size(x, 2)
                res = res + (x(:, i, :) - center)**order
              end do
            else
              allocate(mean_, source = mean(x, 2))
              do i = 1, size(x, 2)
                res = res + (x(:, i, :) - mean_)**order
              end do
              deallocate(mean_)
            end if
          case(3)
            if (present(center)) then
              do i = 1, size(x, 3)
                res = res + (x(:, :, i) - center)**order
              end do
            else
              allocate(mean_, source = mean(x, 3))
              do i = 1, size(x, 3)
                res = res + (x(:, :, i) - mean_)**order
              end do
              deallocate(mean_)
            end if
          case default
            call error_stop("ERROR (moment): wrong dimension")
        end select
        res = res / n

      end function moment_3_cxdp_cxdp
      module function moment_4_cxdp_cxdp(x, order, dim, center, mask) result(res)
        complex(xdp), intent(in) :: x(:,:,:,:)
        integer, intent(in) :: order
        integer, intent(in) :: dim
        complex(xdp), intent(in), optional :: center(merge(size(x, 1), size(x, 2), mask=1<dim), merge(size(x, 2), size(x, 3),&
            & mask=2<dim), merge(size(x, 3), size(x, 4), mask=3<dim))
        logical, intent(in), optional :: mask
        complex(xdp) :: res(merge(size(x, 1), size(x, 2), mask=1<dim), merge(size(x, 2), size(x, 3), mask=2<dim), merge(size(x,&
            & 3), size(x, 4), mask=3<dim))

        integer :: i
        real(xdp) :: n
        complex(xdp), allocatable :: mean_(:,:,:)

        if (.not.optval(mask, .true.)) then
          res = ieee_value(1._xdp, ieee_quiet_nan)
          return
        end if

        n = real(size(x, dim), xdp)

        res = 0
        select case(dim)
          case(1)
            if (present(center)) then
              do i = 1, size(x, 1)
                res = res + (x(i, :, :, :) - center)**order
              end do
            else
              allocate(mean_, source = mean(x, 1))
              do i = 1, size(x, 1)
                res = res + (x(i, :, :, :) - mean_)**order
              end do
              deallocate(mean_)
            end if
          case(2)
            if (present(center)) then
              do i = 1, size(x, 2)
                res = res + (x(:, i, :, :) - center)**order
              end do
            else
              allocate(mean_, source = mean(x, 2))
              do i = 1, size(x, 2)
                res = res + (x(:, i, :, :) - mean_)**order
              end do
              deallocate(mean_)
            end if
          case(3)
            if (present(center)) then
              do i = 1, size(x, 3)
                res = res + (x(:, :, i, :) - center)**order
              end do
            else
              allocate(mean_, source = mean(x, 3))
              do i = 1, size(x, 3)
                res = res + (x(:, :, i, :) - mean_)**order
              end do
              deallocate(mean_)
            end if
          case(4)
            if (present(center)) then
              do i = 1, size(x, 4)
                res = res + (x(:, :, :, i) - center)**order
              end do
            else
              allocate(mean_, source = mean(x, 4))
              do i = 1, size(x, 4)
                res = res + (x(:, :, :, i) - mean_)**order
              end do
              deallocate(mean_)
            end if
          case default
            call error_stop("ERROR (moment): wrong dimension")
        end select
        res = res / n

      end function moment_4_cxdp_cxdp
      module function moment_1_cqp_cqp(x, order, dim, center, mask) result(res)
        complex(qp), intent(in) :: x(:)
        integer, intent(in) :: order
        integer, intent(in) :: dim
        complex(qp), intent(in), optional :: center
        logical, intent(in), optional :: mask
        complex(qp) :: res

        integer :: i
        real(qp) :: n
        complex(qp), allocatable :: mean_

        if (.not.optval(mask, .true.)) then
          res = ieee_value(1._qp, ieee_quiet_nan)
          return
        end if

        n = real(size(x, dim), qp)

        res = 0
        select case(dim)
          case(1)
            if (present(center)) then
              do i = 1, size(x, 1)
                res = res + (x(i) - center)**order
              end do
            else
              allocate(mean_, source = mean(x, 1))
              do i = 1, size(x, 1)
                res = res + (x(i) - mean_)**order
              end do
              deallocate(mean_)
            end if
          case default
            call error_stop("ERROR (moment): wrong dimension")
        end select
        res = res / n

      end function moment_1_cqp_cqp
      module function moment_2_cqp_cqp(x, order, dim, center, mask) result(res)
        complex(qp), intent(in) :: x(:,:)
        integer, intent(in) :: order
        integer, intent(in) :: dim
        complex(qp), intent(in), optional :: center(merge(size(x, 1), size(x, 2), mask=1<dim))
        logical, intent(in), optional :: mask
        complex(qp) :: res(merge(size(x, 1), size(x, 2), mask=1<dim))

        integer :: i
        real(qp) :: n
        complex(qp), allocatable :: mean_(:)

        if (.not.optval(mask, .true.)) then
          res = ieee_value(1._qp, ieee_quiet_nan)
          return
        end if

        n = real(size(x, dim), qp)

        res = 0
        select case(dim)
          case(1)
            if (present(center)) then
              do i = 1, size(x, 1)
                res = res + (x(i, :) - center)**order
              end do
            else
              allocate(mean_, source = mean(x, 1))
              do i = 1, size(x, 1)
                res = res + (x(i, :) - mean_)**order
              end do
              deallocate(mean_)
            end if
          case(2)
            if (present(center)) then
              do i = 1, size(x, 2)
                res = res + (x(:, i) - center)**order
              end do
            else
              allocate(mean_, source = mean(x, 2))
              do i = 1, size(x, 2)
                res = res + (x(:, i) - mean_)**order
              end do
              deallocate(mean_)
            end if
          case default
            call error_stop("ERROR (moment): wrong dimension")
        end select
        res = res / n

      end function moment_2_cqp_cqp
      module function moment_3_cqp_cqp(x, order, dim, center, mask) result(res)
        complex(qp), intent(in) :: x(:,:,:)
        integer, intent(in) :: order
        integer, intent(in) :: dim
        complex(qp), intent(in), optional :: center(merge(size(x, 1), size(x, 2), mask=1<dim), merge(size(x, 2), size(x, 3),&
            & mask=2<dim))
        logical, intent(in), optional :: mask
        complex(qp) :: res(merge(size(x, 1), size(x, 2), mask=1<dim), merge(size(x, 2), size(x, 3), mask=2<dim))

        integer :: i
        real(qp) :: n
        complex(qp), allocatable :: mean_(:,:)

        if (.not.optval(mask, .true.)) then
          res = ieee_value(1._qp, ieee_quiet_nan)
          return
        end if

        n = real(size(x, dim), qp)

        res = 0
        select case(dim)
          case(1)
            if (present(center)) then
              do i = 1, size(x, 1)
                res = res + (x(i, :, :) - center)**order
              end do
            else
              allocate(mean_, source = mean(x, 1))
              do i = 1, size(x, 1)
                res = res + (x(i, :, :) - mean_)**order
              end do
              deallocate(mean_)
            end if
          case(2)
            if (present(center)) then
              do i = 1, size(x, 2)
                res = res + (x(:, i, :) - center)**order
              end do
            else
              allocate(mean_, source = mean(x, 2))
              do i = 1, size(x, 2)
                res = res + (x(:, i, :) - mean_)**order
              end do
              deallocate(mean_)
            end if
          case(3)
            if (present(center)) then
              do i = 1, size(x, 3)
                res = res + (x(:, :, i) - center)**order
              end do
            else
              allocate(mean_, source = mean(x, 3))
              do i = 1, size(x, 3)
                res = res + (x(:, :, i) - mean_)**order
              end do
              deallocate(mean_)
            end if
          case default
            call error_stop("ERROR (moment): wrong dimension")
        end select
        res = res / n

      end function moment_3_cqp_cqp
      module function moment_4_cqp_cqp(x, order, dim, center, mask) result(res)
        complex(qp), intent(in) :: x(:,:,:,:)
        integer, intent(in) :: order
        integer, intent(in) :: dim
        complex(qp), intent(in), optional :: center(merge(size(x, 1), size(x, 2), mask=1<dim), merge(size(x, 2), size(x, 3),&
            & mask=2<dim), merge(size(x, 3), size(x, 4), mask=3<dim))
        logical, intent(in), optional :: mask
        complex(qp) :: res(merge(size(x, 1), size(x, 2), mask=1<dim), merge(size(x, 2), size(x, 3), mask=2<dim), merge(size(x, 3),&
            & size(x, 4), mask=3<dim))

        integer :: i
        real(qp) :: n
        complex(qp), allocatable :: mean_(:,:,:)

        if (.not.optval(mask, .true.)) then
          res = ieee_value(1._qp, ieee_quiet_nan)
          return
        end if

        n = real(size(x, dim), qp)

        res = 0
        select case(dim)
          case(1)
            if (present(center)) then
              do i = 1, size(x, 1)
                res = res + (x(i, :, :, :) - center)**order
              end do
            else
              allocate(mean_, source = mean(x, 1))
              do i = 1, size(x, 1)
                res = res + (x(i, :, :, :) - mean_)**order
              end do
              deallocate(mean_)
            end if
          case(2)
            if (present(center)) then
              do i = 1, size(x, 2)
                res = res + (x(:, i, :, :) - center)**order
              end do
            else
              allocate(mean_, source = mean(x, 2))
              do i = 1, size(x, 2)
                res = res + (x(:, i, :, :) - mean_)**order
              end do
              deallocate(mean_)
            end if
          case(3)
            if (present(center)) then
              do i = 1, size(x, 3)
                res = res + (x(:, :, i, :) - center)**order
              end do
            else
              allocate(mean_, source = mean(x, 3))
              do i = 1, size(x, 3)
                res = res + (x(:, :, i, :) - mean_)**order
              end do
              deallocate(mean_)
            end if
          case(4)
            if (present(center)) then
              do i = 1, size(x, 4)
                res = res + (x(:, :, :, i) - center)**order
              end do
            else
              allocate(mean_, source = mean(x, 4))
              do i = 1, size(x, 4)
                res = res + (x(:, :, :, i) - mean_)**order
              end do
              deallocate(mean_)
            end if
          case default
            call error_stop("ERROR (moment): wrong dimension")
        end select
        res = res / n

      end function moment_4_cqp_cqp


      module function moment_1_iint8_dp(x, order, dim, center, mask) result(res)
        integer(int8), intent(in) :: x(:)
        integer, intent(in) :: order
        integer, intent(in) :: dim
        real(dp),intent(in), optional :: center
        logical, intent(in), optional :: mask
        real(dp) :: res

        integer :: i
        real(dp) :: n
        real(dp), allocatable :: mean_

        if (.not.optval(mask, .true.)) then
          res = ieee_value(1._dp, ieee_quiet_nan)
          return
        end if

        n = real(size(x, dim), dp)

        res = 0
        select case(dim)
          case(1)
            if (present(center)) then
              do i = 1, size(x, 1)
                res = res + (real(x(i), dp) -&
                  center)**order
              end do
            else
              allocate(mean_, source = mean(x, 1))
              do i = 1, size(x, 1)
                res = res + (real(x(i), dp) - mean_)**order
              end do
              deallocate(mean_)
            end if
          case default
            call error_stop("ERROR (moment): wrong dimension")
        end select
        res = res / n

      end function moment_1_iint8_dp
      module function moment_2_iint8_dp(x, order, dim, center, mask) result(res)
        integer(int8), intent(in) :: x(:,:)
        integer, intent(in) :: order
        integer, intent(in) :: dim
        real(dp),intent(in), optional :: center(merge(size(x, 1), size(x, 2), mask=1<dim))
        logical, intent(in), optional :: mask
        real(dp) :: res(merge(size(x, 1), size(x, 2), mask=1<dim))

        integer :: i
        real(dp) :: n
        real(dp), allocatable :: mean_(:)

        if (.not.optval(mask, .true.)) then
          res = ieee_value(1._dp, ieee_quiet_nan)
          return
        end if

        n = real(size(x, dim), dp)

        res = 0
        select case(dim)
          case(1)
            if (present(center)) then
              do i = 1, size(x, 1)
                res = res + (real(x(i, :), dp) -&
                  center)**order
              end do
            else
              allocate(mean_, source = mean(x, 1))
              do i = 1, size(x, 1)
                res = res + (real(x(i, :), dp) - mean_)**order
              end do
              deallocate(mean_)
            end if
          case(2)
            if (present(center)) then
              do i = 1, size(x, 2)
                res = res + (real(x(:, i), dp) -&
                  center)**order
              end do
            else
              allocate(mean_, source = mean(x, 2))
              do i = 1, size(x, 2)
                res = res + (real(x(:, i), dp) - mean_)**order
              end do
              deallocate(mean_)
            end if
          case default
            call error_stop("ERROR (moment): wrong dimension")
        end select
        res = res / n

      end function moment_2_iint8_dp
      module function moment_3_iint8_dp(x, order, dim, center, mask) result(res)
        integer(int8), intent(in) :: x(:,:,:)
        integer, intent(in) :: order
        integer, intent(in) :: dim
        real(dp),intent(in), optional :: center(merge(size(x, 1), size(x, 2), mask=1<dim), merge(size(x, 2), size(x, 3),&
            & mask=2<dim))
        logical, intent(in), optional :: mask
        real(dp) :: res(merge(size(x, 1), size(x, 2), mask=1<dim), merge(size(x, 2), size(x, 3), mask=2<dim))

        integer :: i
        real(dp) :: n
        real(dp), allocatable :: mean_(:,:)

        if (.not.optval(mask, .true.)) then
          res = ieee_value(1._dp, ieee_quiet_nan)
          return
        end if

        n = real(size(x, dim), dp)

        res = 0
        select case(dim)
          case(1)
            if (present(center)) then
              do i = 1, size(x, 1)
                res = res + (real(x(i, :, :), dp) -&
                  center)**order
              end do
            else
              allocate(mean_, source = mean(x, 1))
              do i = 1, size(x, 1)
                res = res + (real(x(i, :, :), dp) - mean_)**order
              end do
              deallocate(mean_)
            end if
          case(2)
            if (present(center)) then
              do i = 1, size(x, 2)
                res = res + (real(x(:, i, :), dp) -&
                  center)**order
              end do
            else
              allocate(mean_, source = mean(x, 2))
              do i = 1, size(x, 2)
                res = res + (real(x(:, i, :), dp) - mean_)**order
              end do
              deallocate(mean_)
            end if
          case(3)
            if (present(center)) then
              do i = 1, size(x, 3)
                res = res + (real(x(:, :, i), dp) -&
                  center)**order
              end do
            else
              allocate(mean_, source = mean(x, 3))
              do i = 1, size(x, 3)
                res = res + (real(x(:, :, i), dp) - mean_)**order
              end do
              deallocate(mean_)
            end if
          case default
            call error_stop("ERROR (moment): wrong dimension")
        end select
        res = res / n

      end function moment_3_iint8_dp
      module function moment_4_iint8_dp(x, order, dim, center, mask) result(res)
        integer(int8), intent(in) :: x(:,:,:,:)
        integer, intent(in) :: order
        integer, intent(in) :: dim
        real(dp),intent(in), optional :: center(merge(size(x, 1), size(x, 2), mask=1<dim), merge(size(x, 2), size(x, 3),&
            & mask=2<dim), merge(size(x, 3), size(x, 4), mask=3<dim))
        logical, intent(in), optional :: mask
        real(dp) :: res(merge(size(x, 1), size(x, 2), mask=1<dim), merge(size(x, 2), size(x, 3), mask=2<dim), merge(size(x, 3),&
            & size(x, 4), mask=3<dim))

        integer :: i
        real(dp) :: n
        real(dp), allocatable :: mean_(:,:,:)

        if (.not.optval(mask, .true.)) then
          res = ieee_value(1._dp, ieee_quiet_nan)
          return
        end if

        n = real(size(x, dim), dp)

        res = 0
        select case(dim)
          case(1)
            if (present(center)) then
              do i = 1, size(x, 1)
                res = res + (real(x(i, :, :, :), dp) -&
                  center)**order
              end do
            else
              allocate(mean_, source = mean(x, 1))
              do i = 1, size(x, 1)
                res = res + (real(x(i, :, :, :), dp) - mean_)**order
              end do
              deallocate(mean_)
            end if
          case(2)
            if (present(center)) then
              do i = 1, size(x, 2)
                res = res + (real(x(:, i, :, :), dp) -&
                  center)**order
              end do
            else
              allocate(mean_, source = mean(x, 2))
              do i = 1, size(x, 2)
                res = res + (real(x(:, i, :, :), dp) - mean_)**order
              end do
              deallocate(mean_)
            end if
          case(3)
            if (present(center)) then
              do i = 1, size(x, 3)
                res = res + (real(x(:, :, i, :), dp) -&
                  center)**order
              end do
            else
              allocate(mean_, source = mean(x, 3))
              do i = 1, size(x, 3)
                res = res + (real(x(:, :, i, :), dp) - mean_)**order
              end do
              deallocate(mean_)
            end if
          case(4)
            if (present(center)) then
              do i = 1, size(x, 4)
                res = res + (real(x(:, :, :, i), dp) -&
                  center)**order
              end do
            else
              allocate(mean_, source = mean(x, 4))
              do i = 1, size(x, 4)
                res = res + (real(x(:, :, :, i), dp) - mean_)**order
              end do
              deallocate(mean_)
            end if
          case default
            call error_stop("ERROR (moment): wrong dimension")
        end select
        res = res / n

      end function moment_4_iint8_dp
      module function moment_1_iint16_dp(x, order, dim, center, mask) result(res)
        integer(int16), intent(in) :: x(:)
        integer, intent(in) :: order
        integer, intent(in) :: dim
        real(dp),intent(in), optional :: center
        logical, intent(in), optional :: mask
        real(dp) :: res

        integer :: i
        real(dp) :: n
        real(dp), allocatable :: mean_

        if (.not.optval(mask, .true.)) then
          res = ieee_value(1._dp, ieee_quiet_nan)
          return
        end if

        n = real(size(x, dim), dp)

        res = 0
        select case(dim)
          case(1)
            if (present(center)) then
              do i = 1, size(x, 1)
                res = res + (real(x(i), dp) -&
                  center)**order
              end do
            else
              allocate(mean_, source = mean(x, 1))
              do i = 1, size(x, 1)
                res = res + (real(x(i), dp) - mean_)**order
              end do
              deallocate(mean_)
            end if
          case default
            call error_stop("ERROR (moment): wrong dimension")
        end select
        res = res / n

      end function moment_1_iint16_dp
      module function moment_2_iint16_dp(x, order, dim, center, mask) result(res)
        integer(int16), intent(in) :: x(:,:)
        integer, intent(in) :: order
        integer, intent(in) :: dim
        real(dp),intent(in), optional :: center(merge(size(x, 1), size(x, 2), mask=1<dim))
        logical, intent(in), optional :: mask
        real(dp) :: res(merge(size(x, 1), size(x, 2), mask=1<dim))

        integer :: i
        real(dp) :: n
        real(dp), allocatable :: mean_(:)

        if (.not.optval(mask, .true.)) then
          res = ieee_value(1._dp, ieee_quiet_nan)
          return
        end if

        n = real(size(x, dim), dp)

        res = 0
        select case(dim)
          case(1)
            if (present(center)) then
              do i = 1, size(x, 1)
                res = res + (real(x(i, :), dp) -&
                  center)**order
              end do
            else
              allocate(mean_, source = mean(x, 1))
              do i = 1, size(x, 1)
                res = res + (real(x(i, :), dp) - mean_)**order
              end do
              deallocate(mean_)
            end if
          case(2)
            if (present(center)) then
              do i = 1, size(x, 2)
                res = res + (real(x(:, i), dp) -&
                  center)**order
              end do
            else
              allocate(mean_, source = mean(x, 2))
              do i = 1, size(x, 2)
                res = res + (real(x(:, i), dp) - mean_)**order
              end do
              deallocate(mean_)
            end if
          case default
            call error_stop("ERROR (moment): wrong dimension")
        end select
        res = res / n

      end function moment_2_iint16_dp
      module function moment_3_iint16_dp(x, order, dim, center, mask) result(res)
        integer(int16), intent(in) :: x(:,:,:)
        integer, intent(in) :: order
        integer, intent(in) :: dim
        real(dp),intent(in), optional :: center(merge(size(x, 1), size(x, 2), mask=1<dim), merge(size(x, 2), size(x, 3),&
            & mask=2<dim))
        logical, intent(in), optional :: mask
        real(dp) :: res(merge(size(x, 1), size(x, 2), mask=1<dim), merge(size(x, 2), size(x, 3), mask=2<dim))

        integer :: i
        real(dp) :: n
        real(dp), allocatable :: mean_(:,:)

        if (.not.optval(mask, .true.)) then
          res = ieee_value(1._dp, ieee_quiet_nan)
          return
        end if

        n = real(size(x, dim), dp)

        res = 0
        select case(dim)
          case(1)
            if (present(center)) then
              do i = 1, size(x, 1)
                res = res + (real(x(i, :, :), dp) -&
                  center)**order
              end do
            else
              allocate(mean_, source = mean(x, 1))
              do i = 1, size(x, 1)
                res = res + (real(x(i, :, :), dp) - mean_)**order
              end do
              deallocate(mean_)
            end if
          case(2)
            if (present(center)) then
              do i = 1, size(x, 2)
                res = res + (real(x(:, i, :), dp) -&
                  center)**order
              end do
            else
              allocate(mean_, source = mean(x, 2))
              do i = 1, size(x, 2)
                res = res + (real(x(:, i, :), dp) - mean_)**order
              end do
              deallocate(mean_)
            end if
          case(3)
            if (present(center)) then
              do i = 1, size(x, 3)
                res = res + (real(x(:, :, i), dp) -&
                  center)**order
              end do
            else
              allocate(mean_, source = mean(x, 3))
              do i = 1, size(x, 3)
                res = res + (real(x(:, :, i), dp) - mean_)**order
              end do
              deallocate(mean_)
            end if
          case default
            call error_stop("ERROR (moment): wrong dimension")
        end select
        res = res / n

      end function moment_3_iint16_dp
      module function moment_4_iint16_dp(x, order, dim, center, mask) result(res)
        integer(int16), intent(in) :: x(:,:,:,:)
        integer, intent(in) :: order
        integer, intent(in) :: dim
        real(dp),intent(in), optional :: center(merge(size(x, 1), size(x, 2), mask=1<dim), merge(size(x, 2), size(x, 3),&
            & mask=2<dim), merge(size(x, 3), size(x, 4), mask=3<dim))
        logical, intent(in), optional :: mask
        real(dp) :: res(merge(size(x, 1), size(x, 2), mask=1<dim), merge(size(x, 2), size(x, 3), mask=2<dim), merge(size(x, 3),&
            & size(x, 4), mask=3<dim))

        integer :: i
        real(dp) :: n
        real(dp), allocatable :: mean_(:,:,:)

        if (.not.optval(mask, .true.)) then
          res = ieee_value(1._dp, ieee_quiet_nan)
          return
        end if

        n = real(size(x, dim), dp)

        res = 0
        select case(dim)
          case(1)
            if (present(center)) then
              do i = 1, size(x, 1)
                res = res + (real(x(i, :, :, :), dp) -&
                  center)**order
              end do
            else
              allocate(mean_, source = mean(x, 1))
              do i = 1, size(x, 1)
                res = res + (real(x(i, :, :, :), dp) - mean_)**order
              end do
              deallocate(mean_)
            end if
          case(2)
            if (present(center)) then
              do i = 1, size(x, 2)
                res = res + (real(x(:, i, :, :), dp) -&
                  center)**order
              end do
            else
              allocate(mean_, source = mean(x, 2))
              do i = 1, size(x, 2)
                res = res + (real(x(:, i, :, :), dp) - mean_)**order
              end do
              deallocate(mean_)
            end if
          case(3)
            if (present(center)) then
              do i = 1, size(x, 3)
                res = res + (real(x(:, :, i, :), dp) -&
                  center)**order
              end do
            else
              allocate(mean_, source = mean(x, 3))
              do i = 1, size(x, 3)
                res = res + (real(x(:, :, i, :), dp) - mean_)**order
              end do
              deallocate(mean_)
            end if
          case(4)
            if (present(center)) then
              do i = 1, size(x, 4)
                res = res + (real(x(:, :, :, i), dp) -&
                  center)**order
              end do
            else
              allocate(mean_, source = mean(x, 4))
              do i = 1, size(x, 4)
                res = res + (real(x(:, :, :, i), dp) - mean_)**order
              end do
              deallocate(mean_)
            end if
          case default
            call error_stop("ERROR (moment): wrong dimension")
        end select
        res = res / n

      end function moment_4_iint16_dp
      module function moment_1_iint32_dp(x, order, dim, center, mask) result(res)
        integer(int32), intent(in) :: x(:)
        integer, intent(in) :: order
        integer, intent(in) :: dim
        real(dp),intent(in), optional :: center
        logical, intent(in), optional :: mask
        real(dp) :: res

        integer :: i
        real(dp) :: n
        real(dp), allocatable :: mean_

        if (.not.optval(mask, .true.)) then
          res = ieee_value(1._dp, ieee_quiet_nan)
          return
        end if

        n = real(size(x, dim), dp)

        res = 0
        select case(dim)
          case(1)
            if (present(center)) then
              do i = 1, size(x, 1)
                res = res + (real(x(i), dp) -&
                  center)**order
              end do
            else
              allocate(mean_, source = mean(x, 1))
              do i = 1, size(x, 1)
                res = res + (real(x(i), dp) - mean_)**order
              end do
              deallocate(mean_)
            end if
          case default
            call error_stop("ERROR (moment): wrong dimension")
        end select
        res = res / n

      end function moment_1_iint32_dp
      module function moment_2_iint32_dp(x, order, dim, center, mask) result(res)
        integer(int32), intent(in) :: x(:,:)
        integer, intent(in) :: order
        integer, intent(in) :: dim
        real(dp),intent(in), optional :: center(merge(size(x, 1), size(x, 2), mask=1<dim))
        logical, intent(in), optional :: mask
        real(dp) :: res(merge(size(x, 1), size(x, 2), mask=1<dim))

        integer :: i
        real(dp) :: n
        real(dp), allocatable :: mean_(:)

        if (.not.optval(mask, .true.)) then
          res = ieee_value(1._dp, ieee_quiet_nan)
          return
        end if

        n = real(size(x, dim), dp)

        res = 0
        select case(dim)
          case(1)
            if (present(center)) then
              do i = 1, size(x, 1)
                res = res + (real(x(i, :), dp) -&
                  center)**order
              end do
            else
              allocate(mean_, source = mean(x, 1))
              do i = 1, size(x, 1)
                res = res + (real(x(i, :), dp) - mean_)**order
              end do
              deallocate(mean_)
            end if
          case(2)
            if (present(center)) then
              do i = 1, size(x, 2)
                res = res + (real(x(:, i), dp) -&
                  center)**order
              end do
            else
              allocate(mean_, source = mean(x, 2))
              do i = 1, size(x, 2)
                res = res + (real(x(:, i), dp) - mean_)**order
              end do
              deallocate(mean_)
            end if
          case default
            call error_stop("ERROR (moment): wrong dimension")
        end select
        res = res / n

      end function moment_2_iint32_dp
      module function moment_3_iint32_dp(x, order, dim, center, mask) result(res)
        integer(int32), intent(in) :: x(:,:,:)
        integer, intent(in) :: order
        integer, intent(in) :: dim
        real(dp),intent(in), optional :: center(merge(size(x, 1), size(x, 2), mask=1<dim), merge(size(x, 2), size(x, 3),&
            & mask=2<dim))
        logical, intent(in), optional :: mask
        real(dp) :: res(merge(size(x, 1), size(x, 2), mask=1<dim), merge(size(x, 2), size(x, 3), mask=2<dim))

        integer :: i
        real(dp) :: n
        real(dp), allocatable :: mean_(:,:)

        if (.not.optval(mask, .true.)) then
          res = ieee_value(1._dp, ieee_quiet_nan)
          return
        end if

        n = real(size(x, dim), dp)

        res = 0
        select case(dim)
          case(1)
            if (present(center)) then
              do i = 1, size(x, 1)
                res = res + (real(x(i, :, :), dp) -&
                  center)**order
              end do
            else
              allocate(mean_, source = mean(x, 1))
              do i = 1, size(x, 1)
                res = res + (real(x(i, :, :), dp) - mean_)**order
              end do
              deallocate(mean_)
            end if
          case(2)
            if (present(center)) then
              do i = 1, size(x, 2)
                res = res + (real(x(:, i, :), dp) -&
                  center)**order
              end do
            else
              allocate(mean_, source = mean(x, 2))
              do i = 1, size(x, 2)
                res = res + (real(x(:, i, :), dp) - mean_)**order
              end do
              deallocate(mean_)
            end if
          case(3)
            if (present(center)) then
              do i = 1, size(x, 3)
                res = res + (real(x(:, :, i), dp) -&
                  center)**order
              end do
            else
              allocate(mean_, source = mean(x, 3))
              do i = 1, size(x, 3)
                res = res + (real(x(:, :, i), dp) - mean_)**order
              end do
              deallocate(mean_)
            end if
          case default
            call error_stop("ERROR (moment): wrong dimension")
        end select
        res = res / n

      end function moment_3_iint32_dp
      module function moment_4_iint32_dp(x, order, dim, center, mask) result(res)
        integer(int32), intent(in) :: x(:,:,:,:)
        integer, intent(in) :: order
        integer, intent(in) :: dim
        real(dp),intent(in), optional :: center(merge(size(x, 1), size(x, 2), mask=1<dim), merge(size(x, 2), size(x, 3),&
            & mask=2<dim), merge(size(x, 3), size(x, 4), mask=3<dim))
        logical, intent(in), optional :: mask
        real(dp) :: res(merge(size(x, 1), size(x, 2), mask=1<dim), merge(size(x, 2), size(x, 3), mask=2<dim), merge(size(x, 3),&
            & size(x, 4), mask=3<dim))

        integer :: i
        real(dp) :: n
        real(dp), allocatable :: mean_(:,:,:)

        if (.not.optval(mask, .true.)) then
          res = ieee_value(1._dp, ieee_quiet_nan)
          return
        end if

        n = real(size(x, dim), dp)

        res = 0
        select case(dim)
          case(1)
            if (present(center)) then
              do i = 1, size(x, 1)
                res = res + (real(x(i, :, :, :), dp) -&
                  center)**order
              end do
            else
              allocate(mean_, source = mean(x, 1))
              do i = 1, size(x, 1)
                res = res + (real(x(i, :, :, :), dp) - mean_)**order
              end do
              deallocate(mean_)
            end if
          case(2)
            if (present(center)) then
              do i = 1, size(x, 2)
                res = res + (real(x(:, i, :, :), dp) -&
                  center)**order
              end do
            else
              allocate(mean_, source = mean(x, 2))
              do i = 1, size(x, 2)
                res = res + (real(x(:, i, :, :), dp) - mean_)**order
              end do
              deallocate(mean_)
            end if
          case(3)
            if (present(center)) then
              do i = 1, size(x, 3)
                res = res + (real(x(:, :, i, :), dp) -&
                  center)**order
              end do
            else
              allocate(mean_, source = mean(x, 3))
              do i = 1, size(x, 3)
                res = res + (real(x(:, :, i, :), dp) - mean_)**order
              end do
              deallocate(mean_)
            end if
          case(4)
            if (present(center)) then
              do i = 1, size(x, 4)
                res = res + (real(x(:, :, :, i), dp) -&
                  center)**order
              end do
            else
              allocate(mean_, source = mean(x, 4))
              do i = 1, size(x, 4)
                res = res + (real(x(:, :, :, i), dp) - mean_)**order
              end do
              deallocate(mean_)
            end if
          case default
            call error_stop("ERROR (moment): wrong dimension")
        end select
        res = res / n

      end function moment_4_iint32_dp
      module function moment_1_iint64_dp(x, order, dim, center, mask) result(res)
        integer(int64), intent(in) :: x(:)
        integer, intent(in) :: order
        integer, intent(in) :: dim
        real(dp),intent(in), optional :: center
        logical, intent(in), optional :: mask
        real(dp) :: res

        integer :: i
        real(dp) :: n
        real(dp), allocatable :: mean_

        if (.not.optval(mask, .true.)) then
          res = ieee_value(1._dp, ieee_quiet_nan)
          return
        end if

        n = real(size(x, dim), dp)

        res = 0
        select case(dim)
          case(1)
            if (present(center)) then
              do i = 1, size(x, 1)
                res = res + (real(x(i), dp) -&
                  center)**order
              end do
            else
              allocate(mean_, source = mean(x, 1))
              do i = 1, size(x, 1)
                res = res + (real(x(i), dp) - mean_)**order
              end do
              deallocate(mean_)
            end if
          case default
            call error_stop("ERROR (moment): wrong dimension")
        end select
        res = res / n

      end function moment_1_iint64_dp
      module function moment_2_iint64_dp(x, order, dim, center, mask) result(res)
        integer(int64), intent(in) :: x(:,:)
        integer, intent(in) :: order
        integer, intent(in) :: dim
        real(dp),intent(in), optional :: center(merge(size(x, 1), size(x, 2), mask=1<dim))
        logical, intent(in), optional :: mask
        real(dp) :: res(merge(size(x, 1), size(x, 2), mask=1<dim))

        integer :: i
        real(dp) :: n
        real(dp), allocatable :: mean_(:)

        if (.not.optval(mask, .true.)) then
          res = ieee_value(1._dp, ieee_quiet_nan)
          return
        end if

        n = real(size(x, dim), dp)

        res = 0
        select case(dim)
          case(1)
            if (present(center)) then
              do i = 1, size(x, 1)
                res = res + (real(x(i, :), dp) -&
                  center)**order
              end do
            else
              allocate(mean_, source = mean(x, 1))
              do i = 1, size(x, 1)
                res = res + (real(x(i, :), dp) - mean_)**order
              end do
              deallocate(mean_)
            end if
          case(2)
            if (present(center)) then
              do i = 1, size(x, 2)
                res = res + (real(x(:, i), dp) -&
                  center)**order
              end do
            else
              allocate(mean_, source = mean(x, 2))
              do i = 1, size(x, 2)
                res = res + (real(x(:, i), dp) - mean_)**order
              end do
              deallocate(mean_)
            end if
          case default
            call error_stop("ERROR (moment): wrong dimension")
        end select
        res = res / n

      end function moment_2_iint64_dp
      module function moment_3_iint64_dp(x, order, dim, center, mask) result(res)
        integer(int64), intent(in) :: x(:,:,:)
        integer, intent(in) :: order
        integer, intent(in) :: dim
        real(dp),intent(in), optional :: center(merge(size(x, 1), size(x, 2), mask=1<dim), merge(size(x, 2), size(x, 3),&
            & mask=2<dim))
        logical, intent(in), optional :: mask
        real(dp) :: res(merge(size(x, 1), size(x, 2), mask=1<dim), merge(size(x, 2), size(x, 3), mask=2<dim))

        integer :: i
        real(dp) :: n
        real(dp), allocatable :: mean_(:,:)

        if (.not.optval(mask, .true.)) then
          res = ieee_value(1._dp, ieee_quiet_nan)
          return
        end if

        n = real(size(x, dim), dp)

        res = 0
        select case(dim)
          case(1)
            if (present(center)) then
              do i = 1, size(x, 1)
                res = res + (real(x(i, :, :), dp) -&
                  center)**order
              end do
            else
              allocate(mean_, source = mean(x, 1))
              do i = 1, size(x, 1)
                res = res + (real(x(i, :, :), dp) - mean_)**order
              end do
              deallocate(mean_)
            end if
          case(2)
            if (present(center)) then
              do i = 1, size(x, 2)
                res = res + (real(x(:, i, :), dp) -&
                  center)**order
              end do
            else
              allocate(mean_, source = mean(x, 2))
              do i = 1, size(x, 2)
                res = res + (real(x(:, i, :), dp) - mean_)**order
              end do
              deallocate(mean_)
            end if
          case(3)
            if (present(center)) then
              do i = 1, size(x, 3)
                res = res + (real(x(:, :, i), dp) -&
                  center)**order
              end do
            else
              allocate(mean_, source = mean(x, 3))
              do i = 1, size(x, 3)
                res = res + (real(x(:, :, i), dp) - mean_)**order
              end do
              deallocate(mean_)
            end if
          case default
            call error_stop("ERROR (moment): wrong dimension")
        end select
        res = res / n

      end function moment_3_iint64_dp
      module function moment_4_iint64_dp(x, order, dim, center, mask) result(res)
        integer(int64), intent(in) :: x(:,:,:,:)
        integer, intent(in) :: order
        integer, intent(in) :: dim
        real(dp),intent(in), optional :: center(merge(size(x, 1), size(x, 2), mask=1<dim), merge(size(x, 2), size(x, 3),&
            & mask=2<dim), merge(size(x, 3), size(x, 4), mask=3<dim))
        logical, intent(in), optional :: mask
        real(dp) :: res(merge(size(x, 1), size(x, 2), mask=1<dim), merge(size(x, 2), size(x, 3), mask=2<dim), merge(size(x, 3),&
            & size(x, 4), mask=3<dim))

        integer :: i
        real(dp) :: n
        real(dp), allocatable :: mean_(:,:,:)

        if (.not.optval(mask, .true.)) then
          res = ieee_value(1._dp, ieee_quiet_nan)
          return
        end if

        n = real(size(x, dim), dp)

        res = 0
        select case(dim)
          case(1)
            if (present(center)) then
              do i = 1, size(x, 1)
                res = res + (real(x(i, :, :, :), dp) -&
                  center)**order
              end do
            else
              allocate(mean_, source = mean(x, 1))
              do i = 1, size(x, 1)
                res = res + (real(x(i, :, :, :), dp) - mean_)**order
              end do
              deallocate(mean_)
            end if
          case(2)
            if (present(center)) then
              do i = 1, size(x, 2)
                res = res + (real(x(:, i, :, :), dp) -&
                  center)**order
              end do
            else
              allocate(mean_, source = mean(x, 2))
              do i = 1, size(x, 2)
                res = res + (real(x(:, i, :, :), dp) - mean_)**order
              end do
              deallocate(mean_)
            end if
          case(3)
            if (present(center)) then
              do i = 1, size(x, 3)
                res = res + (real(x(:, :, i, :), dp) -&
                  center)**order
              end do
            else
              allocate(mean_, source = mean(x, 3))
              do i = 1, size(x, 3)
                res = res + (real(x(:, :, i, :), dp) - mean_)**order
              end do
              deallocate(mean_)
            end if
          case(4)
            if (present(center)) then
              do i = 1, size(x, 4)
                res = res + (real(x(:, :, :, i), dp) -&
                  center)**order
              end do
            else
              allocate(mean_, source = mean(x, 4))
              do i = 1, size(x, 4)
                res = res + (real(x(:, :, :, i), dp) - mean_)**order
              end do
              deallocate(mean_)
            end if
          case default
            call error_stop("ERROR (moment): wrong dimension")
        end select
        res = res / n

      end function moment_4_iint64_dp

end submodule
