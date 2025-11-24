
<aside class="sidebar-wrapper" data-simplebar="true">
    <div class="sidebar-header">
        <a href="{{ url('/') }}" target="_blank">
            <img src="{{ asset('') . $websiteInfo->logo }}" alt=" Logo" style="height: 65px;  aspect-ratio: 3 / 1;">
        </a>
    </div>
    <!--navigation-->
    <ul class="metismenu" id="menu">
        @if (Auth::user()->user_type === 'admin' && Auth::user()->stuff_type === 1)
        {{-- @if (Auth::user()->user_type === 'admin' && Auth::user()->stuff_type === '1') --}}
            <li>
                <a href="{{ route('admin.dashboard') }}">
                    <div class="parent-icon"><i class="bi bi-house-door"></i>
                    </div>
                    <div class="menu-title">Dashboard</div>
                </a>

            </li>
            <hr>
            <li>
                <a href="javascript:;" class="has-arrow">
                    <div class="parent-icon"><i class="bi bi-house-door"></i>
                    </div>
                    <div class="menu-title">Products</div>
                </a>
                <ul>
                    <li>
                        <a href="{{ route('admin.product.create') }}"><i class="bi bi-arrow-right-short"></i>Add New Products</a>
                    </li>
                    <li>
                        <a href="{{ route('admin.product.index') }}"><i class="bi bi-arrow-right-short"></i>All Products</a>
                    </li>

                    <li>
                        <a href="{{ route('admin.category.index') }}"><i class="bi bi-arrow-right-short"></i>All Category</a>
                    </li>

                    <li>
                        <a href="{{ route('admin.color.index') }}"><i class="bi bi-arrow-right-short"></i>All Color</a>
                    </li>

                    <li>
                        <a href="{{ route('admin.gotoimportCSV') }}"><i class="bi bi-arrow-right-short"></i>Products CSV Import</a>
                    </li>
                    <li>
                        <a href="{{ route('admin.stockpriceedit') }}"><i class="bi bi-arrow-right-short"></i>Stock & Price Edit</a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="javascript:;" class="has-arrow">
                    <div class="parent-icon"><i class="bi bi-house-door"></i>
                    </div>
                    <div class="menu-title">Orders</div>
                </a>
                <ul>
                    <li>
                        <a href="{{ route('admin.order.allOrders') }}"><i class="bi bi-arrow-right-short"></i>All Orders</a>
                    </li>
                    <li>
                        <a href="{{ route('admin.order.pendingOrder') }}"><i class="bi bi-arrow-right-short"></i>Pending Order</a>
                    </li>
                    <li>
                        <a href="{{ route('admin.order.approvedOrder') }}"><i class="bi bi-arrow-right-short"></i>Approved Orders</a>
                    </li>
                    <li>
                        <a href="{{ route('admin.order.shippingOrder') }}"><i class="bi bi-arrow-right-short"></i>Shipping Orders</a>
                    </li>
                    <li>
                        <a href="{{ route('admin.order.deliveredOrder') }}"><i class="bi bi-arrow-right-short"></i>Delivered Orders</a>
                    </li>
                    <li>
                        <a href="{{ route('admin.order.cancelledOrder') }}"><i class="bi bi-arrow-right-short"></i>Cancelled Orders</a>
                    </li>
                </ul>
            </li>

            <li>
                <a href="javascript:;" class="has-arrow">
                    <div class="parent-icon"><i class="bi bi-house-door"></i>
                    </div>
                    <div class="menu-title">Reports</div>
                </a>
                <ul>
                    <li>
                        <a href="{{ route('admin.report.productStock') }}"><i class="bi bi-arrow-right-short"></i>Products Stock</a>
                    </li>
                    <li>
                        <a href="{{ route('admin.report.productSale') }}"><i class="bi bi-arrow-right-short"></i>Products Sale</a>
                    </li>

                    <li>
                        <a href="{{ route('admin.report.lowStockProduct') }}"><i class="bi bi-arrow-right-short"></i>Low Stock Products</a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="javascript:;" class="has-arrow">
                    <div class="parent-icon"><i class="bi bi-house-door"></i>
                    </div>
                    <div class="menu-title">Website Setup</div>
                </a>
                <ul>
                    <li>
                        <a href="{{ route('admin.website.info') }}"><i class="bi bi-arrow-right-short"></i>website Info</a>
                    </li>
                    <li>
                        <a href="{{ route('admin.home.homeSlider.index') }}"><i class="bi bi-arrow-right-short"></i>Home Slider</a>
                    </li>
                    <li>
                        <a href="{{ route('admin.home.banner.index') }}"><i class="bi bi-arrow-right-short"></i>Banner Upload</a>
                    </li>
                    <li>
                        <a href="{{ route('admin.home.singleBanner.index') }}"><i class="bi bi-arrow-right-short"></i>Single Upload</a>
                    </li>
                    <li>
                        <a href="{{ route('admin.home.section.index') }}"><i class="bi bi-arrow-right-short"></i>Home Scroll Sections</a>
                    </li>

                    <li>
                        <a href="{{ route('admin.section.product') }}"><i class="bi bi-arrow-right-short"></i>Products Publish in Section</a>
                    </li>
                    <li>
                        <a href="{{ route('admin.pixelGtm') }}"><i class="bi bi-arrow-right-short"></i>Pixel & Gtm</a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="javascript:;" class="has-arrow">
                    <div class="parent-icon"><i class="bi bi-house-door"></i>
                    </div>
                    <div class="menu-title">Blog System</div>
                </a>
                <ul>
                    <li>
                        <a href="{{ route('admin.blogCategory.index') }}"><i class="bi bi-arrow-right-short"></i>Blog Category</a>
                    </li>
                    <li>
                        <a href="{{ route('admin.blogContent.index') }}"><i class="bi bi-arrow-right-short"></i>All Posts</a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="javascript:;" class="has-arrow">
                    <div class="parent-icon"><i class="bi bi-house-door"></i>
                    </div>
                    <div class="menu-title">Administration</div>
                </a>
                <ul>
                    <li>
                        <a href="{{ route('admin.settings.index') }}"><i class="bi bi-arrow-right-short"></i>Shipping charge</a>
                    </li>
                    <li>
                        <a href="{{ route('admin.clientReview.index') }}"><i class="bi bi-arrow-right-short"></i>Client Reviews</a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="javascript:;" class="has-arrow">
                    <div class="parent-icon"><i class="bi bi-house-door"></i>
                    </div>
                    <div class="menu-title">Staff Manage</div>
                </a>
                <ul>
                    <li>
                        <a href="{{ route('admin.staff.index') }}"><i class="bi bi-arrow-right-short"></i>All Staff</a>
                    </li>
                </ul>
            </li>

            {{-- <li>
                <a href="{{ route('admin.withdraw.index') }}"><i class="bi bi-arrow-right-short"></i>Withdraw Manage</a>
            </li> --}}

            {{-- <li class="{{ request()->routeIs('admin.refer.*') ? 'mm-active' : '' }}">
                <a href="{{ route('admin.refer.index') }}"><i class="bi bi-arrow-right-short"></i>Referred By</a>
            </li> --}}

            <li>
                <a href="javascript:;" class="has-arrow">
                    <div class="parent-icon"><i class="bi bi-house-door"></i>
                    </div>
                    <div class="menu-title">Pages</div>
                </a>
                <ul>
                    {{-- <li>
                        <a href="{{ route('admin.faqmanage') }}"><i class="bi bi-arrow-right-short"></i>FAQ Manage</a>
                    </li>
                    <li>
                        <a href="{{ route('admin.termsmanage') }}"><i class="bi bi-arrow-right-short"></i>Terms & Condition</a>
                    </li>
                    <li>
                        <a href="{{ route('admin.refundmanage') }}"><i class="bi bi-arrow-right-short"></i>Refund Policy</a>
                    </li>
                    <li>
                        <a href="{{ route('admin.webrandmanage') }}"><i class="bi bi-arrow-right-short"></i>Web are brand</a>
                    </li>
                    <li>
                        <a href="{{ route('admin.mapli') }}"><i class="bi bi-arrow-right-short"></i>Map & Licence</a>
                    </li>
                    <li>
                        <a href="{{ route('admin.btob') }}"><i class="bi bi-arrow-right-short"></i>B 2 B Business</a>
                    </li>
                    <li>
                        <a href="{{ route('admin.topmarmanage') }}"><i class="bi bi-arrow-right-short"></i>Top Notification Slider</a>
                    </li> --}}
                    <li>
                        <a href="{{ route('admin.subscriber') }}"><i class="bi bi-arrow-right-short"></i>Subscriber List</a>
                    </li>
                </ul>
            </li>

            <li>
                <a href="javascript:;" class="has-arrow">
                    <div class="parent-icon"><i class="bi bi-house-door"></i>
                    </div>
                    <div class="menu-title">Privacy Policy</div>
                </a>
                <ul>
                    <li>
                        <a href="{{ route('privacy.index') }}"><i class="bi bi-arrow-right-short"></i>Update Privacy Policy</a>
                    </li>
                </ul>
            </li>


        @elseif (Auth::user()->user_type === 'admin' && Auth::user()->stuff_type == 2 && Auth::user()->status === "active")
            <li>
                <a href="{{ route('admin.order.allOrders') }}"><i class="bi bi-arrow-right-short"></i>All Orders</a>
            </li>
            <li>
                <a href="{{ route('admin.order.pendingOrder') }}"><i class="bi bi-arrow-right-short"></i>Pending Order</a>
            </li>
            <li>
                <a href="{{ route('admin.order.approvedOrder') }}"><i class="bi bi-arrow-right-short"></i>Approved Orders</a>
            </li>
            <li>
                <a href="{{ route('admin.order.shippingOrder') }}"><i class="bi bi-arrow-right-short"></i>Shipping Orders</a>
            </li>
            <li>
                <a href="{{ route('admin.order.deliveredOrder') }}"><i class="bi bi-arrow-right-short"></i>Delivered Orders</a>
            </li>
            <li>
                <a href="{{ route('admin.order.cancelledOrder') }}"><i class="bi bi-arrow-right-short"></i>Cancelled Orders</a>
            </li>
        @else
            <p>Account not active</p>
        @endif
    </ul>
    <!--end navigation-->
</aside>
