<template>
    <div class="col-lg-10 col-lg-offset-1 col-md-10 col-md-offset-1 col-sm-12 col-xs-12 main" id="totitle">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12 text-title">
                <h4>
                    <a href="">文章标题1111111111111111111111111111111111111111111111111111111111111111111111111111111111</a>
                </h4>
                <p>
                    <small>作者：<a href="" class="text-author">一旬</a> </small>
                    <small>围观群众:<small class="visited-number">121</small></small>
                    <small>分类：<label class="text-category"> <span class="label label-default">运动</span></label></small>
                    <small>更新于：<label class="text-updatetime">2019年12月10日 18:47</label></small>
                </p>
            </div>
            <div class="col-lg-3 col-md-3 col-sm-3 col-xs-0 text-time hidden-xs">
                <span class="day">06</span>
                <div class="monthandyear">
                    <div class="month">02月</div>
                    <div class="year">2020年</div>
                </div>
            </div>
        </div>
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-content">
            实验要求：每1s输出一次最新RTC时间。定时把RTC时间存入到FLASH中，当系统重新启动后，能够恢复FLASH中的RTC时间，继续进行计时。
            项目下载地址：https://pan.baidu.com/s/1NGh6u9MMCn_9fhaP8DopKg 提取码：whv6
            实验思路：系统上电后先读取fatfs文件信息，当读到time标志后将后面的时间数据提取出来进行解析并赋值给my_sTime和my_sDate，如果没有读到time标志则认为fatfs数据不可用
            并给my_sTime和my_sDate赋默认值，进入主循环后获取当前时间并输出，然后将当前信息存储到SD卡中，延时1s。
            主函数中代码较多，所以讲挂载、格式化、读磁盘状态、读文件、写文件的相应代码分别封装成函数以便使用。
            函数详解：
            写文件：

            void file_write(uint8_t res, FIL *pf, RTC_TimeTypeDef *my_sTime, RTC_DateTypeDef
            *my_sDate)
            {
            res = f_open(pf, "0:/test.txt", FA_OPEN_ALWAYS | FA_WRITE);
            if (res == FR_OK)
            {
            printf("creat ok\n");
            }
            else
            {
            printf("creat failed\n");
            printf("error code: %d\n",res);
            }
            // char tr1[]="1234567890abc!\n";
            f_printf(pf, "time%d-%d-%d %d:%d:%d*",my_sDate->Year, my_sDate->Month,
            my_sDate->Date, my_sTime->Hours, \
            my_sTime->Minutes, my_sTime->Seconds); // 格式化输出
            //f_printf(pf, "0000000000000000000000000000000000000000000000000000");
            res = f_close(pf);
            if (res != FR_OK)
            {
            printf("close file error\n");
            printf("error code: %d\n",res);
            }
            else
            {
            // printf("write data OK");
            }
            }

            将时间数据格式化写入SD卡，并在数据前加上time作为标志。
            读文件：

            uint8_t *file_read(uint8_t res, FIL *file, uint8_t num)
            {
        </div>

        <div class="col-lg-3 col-lg-offset-4 col-md-3  col-md-offset-4 col-sm-12 col-xs-12 text-share">
            <div class="collect">
                <div class="collect-hover">添加至收藏夹</div>
                <span class="glyphicon glyphicon-star-empty ico-collect"></span>
                <span class="collect-number">66666</span>
            </div>
            <div class="like">
                <div class="like-hover">喜欢，点个赞</div>
                <span class="glyphicon glyphicon-heart-empty ico-like"></span>
                <span class="like-number">99999</span>
            </div>
            <div class="visited">
                <div class="visited-hover">这篇文章的阅读次数</div>
                <span class="glyphicon glyphicon-eye-open ico-visited"></span>
                <span class="visited-number">22222</span>
            </div>
        </div>
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-relate">
            <div class="relate-head">延伸阅读</div>
            <div class="relate-text-title">
                <p>和平精英</p>
                <p>和平精英</p>
            </div>
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-message">
                <div class="relate-head">发表评论</div>
                <div style="margin-top:20px;">
                    <textarea class="form-control" rows="3"></textarea>
                    <label>
                        <button class="btn btn-success" style="margin-top:20px;">提交</button>
                    </label>

                </div>

            </div>

            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-message">
                <div class="relate-head">瓜友讨论区</div>


            </div>

            <button class="btn btn-default totitle" style="position:fixed;bottom:10%;right:10%;font-size:12px;padding:0;"><a
                    href="#totitle"> <span
                    class="glyphicon glyphicon-menu-up"></span><br>返回顶部</a>
            </button>
        </div>
    </div>
</template>

<script>
    export default {
        name:"text-detail"
    }
</script>

<style scoped>
    .share-img::before {
        display: inline-block;
        content: "";
        background-image: url("data:image/svg+xml,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 16 16'><path fill='none' stroke='%23333' stroke-linecap='round' stroke-linejoin='round' stroke-width='2' d='M5 14l6-6-6-6'/></svg>");
        background-repeat: no-repeat;
        background-size: 1rem 1rem;
    }
</style>