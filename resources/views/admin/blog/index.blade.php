@extends('admin.blog.base')
@section('action-content')
    <!-- Main content -->
    <section class="content">
        <div class="box">
            <div class="box-header">
                <div class="row">
                    <div class="col-sm-4">
                        <a class="btn btn-primary" href="{{ route('blog.create') }}">Thêm mới bài viết</a>
                    </div>
                </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
                <div class="row">
                    <div class="col-sm-6"></div>
                    <div class="col-sm-6"></div>
                </div>
                <form method="POST" action="{{ route('blog.search') }}">
                    {{ csrf_field() }}
                    <input type="hidden" name="type" value="advise" />
                    @component('admin.layouts.search', ['title' => 'Tìm kiếm'])
                        @component('admin.blog.search-panel.two-cols-search-row', ['items' => ['Title'],
                        'oldVals' => [isset($searchingVals) ? $searchingVals['title'] : '']])
                        @endcomponent
                        <br>
                    @endcomponent
                </form>
                <div id="example2_wrapper" class="dataTables_wrapper form-inline dt-bootstrap">
                    <div class="row">
                        <div class="col-sm-12">
                            <table id="example2" class="table table-bordered table-hover dataTable" role="grid" aria-describedby="example2_info">
                                <thead>
                                <tr role="row">
                                    <th>Bài viết</th>
                                    <th>Danh mục</th>
                                    <th>Hành động</th>
                                </tr>
                                </thead>
                                <tbody>
                                @foreach ($blogs as $item)
                                    <tr role="row" class="odd">
                                        <td class="sorting_1">{{ $item->title }}</td>
                                        <td class="sorting_1">{{ $categories[$item->category_id] }}</td>
                                        <td>
                                            <form class="row" method="POST" action="{{ route('blog.destroy', ['id' => $item->id]) }}" onsubmit = "return confirm('Chắc chắn xoá?')">
                                                <input type="hidden" name="_method" value="DELETE">
                                                <input type="hidden" name="_token" value="{{ csrf_token() }}">
                                                <a href="{{ route('blog.edit', ['id' => $item->id]) }}" class="btn btn-warning col-sm-3 col-xs-5 btn-margin">
                                                    Sửa
                                                </a>
                                                {{--                        @if ($user->username != Auth::user()->username)--}}
                                                <button type="submit" class="btn btn-danger col-sm-3 col-xs-5 btn-margin">
                                                    Xoá
                                                </button>
                                                {{--@endif--}}
                                                <a href="{{ route('comment.fetchBlogComment', ['id' => $item->id]) }}" class="btn btn-warning col-sm-2 col-xs-5 btn-margin">
                                                Bình luận
                                                </a>
                                            </form>
                                        </td>
                                    </tr>
                                @endforeach
                                </tbody>
                                @if(count($blogs) > 0)
                                    <tfoot>
                                    <tr>
                                        <th>Bài viết</th>
                                        <th>Danh mục</th>
                                        <th>Hành động</th>
                                    </tr>
                                    </tfoot>
                                @endif
                            </table>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-5">
                            <div class="dataTables_info" id="example2_info" role="status" aria-live="polite">Hiển thị {{count($blogs)}} bài viết</div>
                        </div>
                        <div class="col-sm-7">
                            <div class="dataTables_paginate paging_simple_numbers" id="example2_paginate">
                                {{ $blogs->links() }}
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /.box-body -->
        </div>
    </section>
    <!-- /.content -->
    </div>
@endsection