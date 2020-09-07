<template>
    <div class="col-lg-10 col-lg-offset-1 col-md-10 col-md-offset-1 col-sm-12 col-xs-12 main">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 editor-caption  hidden-xs">
            <h3>Write down your stories, Appreciate the time and freedom</h3>
        </div>
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 diary-title">
            <div class="col-lg-2 col-md-2 col-sm-12 col-xs-12">
                <button class="btn btn-manage">Dairy</button>
            </div>
            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 title-input">
                <input type="text" name="diary-title" placeholder="输入文章标题" maxlength="50"
                       style="width:80%;" /><span class="wordnum">字数<span class="wordnumbers">10</span>/50</span>
            </div>
            <div class="col-lg-2 col-md-2 col-sm-6 col-xs-6">
                <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">文章分类<span class="caret"></span>
                </button>
                <ul class="note-dropdown-menu dropdown-menu note-check dropdown-fontname">

                    <li><a href="#"><i class="note-icon-menu-check"></i>旅行</a></li>
                    <li><a href="#"><i class="note-icon-menu-check"></i>游戏</a></li>
                    <li><a href="#"><i class="note-icon-menu-check"></i>学习</a></li>
                    <li><a href="#"><i class="note-icon-menu-check"></i>美食</a></li>
                    <li><a href="#"><i class="note-icon-menu-check"></i>运动</a></li>
                    <li><a href="#"><i class="note-icon-menu-check"></i>恋爱</a></li>
                    <li role="separator" class="divider"></li>
                    <li><a href="#"><i class="note-icon-menu-check"></i>其他</a></li>

                </ul>
            </div>

            <div class="col-lg-2 col-md-2 col-sm-6 col-xs-6">
                <button class="btn btn-write">&nbsp发布文章</button>
            </div>
        </div>
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 diary-body">
            <div class="text-editor">
                <div id="summernote"><p>在这里记录下你的心情</p></div>
            </div>
        </div>

    </div>
</template>
<script>
    export default{
        name:"text-write"
    }

</script>