@extends('admin.category.base')
@section('action-content')
    <!-- Main content -->
    <section class="content">
      <div class="box">
  <div class="box-header">
    <div class="row">
        <div class="col-sm-4">
          <a class="btn btn-primary" href="{{ route('category.create') }}">Thêm mới danh mục</a>
        </div>
    </div>
  </div>
  <!-- /.box-header -->
  <div class="box-body">
      <div class="row">
        <div class="col-sm-6"></div>
        <div class="col-sm-6"></div>
      </div>
      <form method="POST" action="{{ route('category.search') }}">
         {{ csrf_field() }}
         @component('admin.layouts.search', ['title' => 'Tìm kiếm'])
          @component('admin.category.search-panel.two-cols-search-row', ['items' => ['Name'],
          'oldVals' => [isset($searchingVals) ? $searchingVals['name'] : '']])
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
                <th width="40%" class="sorting_asc" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="Name: activate to sort column descending" aria-sort="ascending">Tên danh mục</th>
                <th width="30%" class="sorting_asc" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="Name: activate to sort column descending" aria-sort="ascending">Thương hiệu</th>
                <th width="10%" class="sorting hidden-xs" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="Email: activate to sort column ascending">Sử dụng?</th>
                <th tabindex="0" aria-controls="example2" rowspan="1" colspan="2" aria-label="Action: activate to sort column ascending">Hành động</th>
              </tr>
            </thead>
            <tbody>
            @foreach ($categories as $item)
                <tr role="row" class="odd">
                  <td class="sorting_1">{{ $item->name }}</td>
                  <td class="sorting_1">{{ isset($item->trademark_id) ? $trademarks[$item->trademark_id] : '' }}</td>
                  @if($item->is_active != 0)
                  <td class="hidden-xs"><span class="glyphicon glyphicon-ok"></span></td>
                  @else
                  <td class="hidden-xs"></td>
                  @endif
                  <td>
                    <form class="row" method="POST" action="{{ route('category.destroy', ['id' => $item->id]) }}" onsubmit = "return confirm('Chắc chắn xoá?')">
                        <input type="hidden" name="_method" value="DELETE">
                        <input type="hidden" name="_token" value="{{ csrf_token() }}">
                        <a href="{{ route('category.edit', ['id' => $item->id]) }}" class="btn btn-warning col-sm-3 col-xs-5 btn-margin">
                        Sửa
                        </a>
{{--                        @if ($user->username != Auth::user()->username)--}}
                         <button type="submit" class="btn btn-danger col-sm-3 col-xs-5 btn-margin">
                          Xoá
                        </button>
                        {{--@endif--}}
                    </form>
                  </td>
              </tr>
            @endforeach
            </tbody>
            @if(count($categories) > 0)
            <tfoot>
              <tr>
                <th width="10%" rowspan="1" colspan="1">Tên danh mục</th>
                <th width="10%" rowspan="1" colspan="1">Thương hiệu</th>
                <th class="hidden-xs" width="20%" rowspan="1" colspan="1">Sử dụng?</th>
                <th rowspan="1" colspan="2">Hành động</th>
              </tr>
            </tfoot>
            @endif
          </table>
        </div>
      </div>
      <div class="row">
        <div class="col-sm-5">
          <div class="dataTables_info" id="example2_info" role="status" aria-live="polite">Showing 1 to {{count($categories)}} of {{count($categories)}} entries</div>
        </div>
        <div class="col-sm-7">
          <div class="dataTables_paginate paging_simple_numbers" id="example2_paginate">
            {{ $categories->links() }}
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