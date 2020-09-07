<template>
    <div class="col-lg-10 col-lg-offset-1 col-md-10 col-md-offset-1 col-sm-12 col-xs-12 main" id="totitle">
        <div class="col-lg-4 col-md-4 col-sm-4 col-xs-0 hidden-xs">
            <div class="col-lg-12 col-md-12 col-sm-0 col-xs-0">
                <div class="text-search">
                    <div class="search-input">
                        <div class="input-group">
                            <input type="text" class="form-control" placeholder="Search for...">
                            <span class="input-group-btn">
									<button class="btn btn-default" type="button">Go!</button>
								</span>
                        </div><!-- /input-group -->
                    </div>
                    <div class="search-cateloge">
                        <ul>
                            <li>
                                <a href="">全部文章</a>
                            </li>
                            <li>
                                <a href="">游戏相关</a>
                            </li>
                            <li>
                                <a href="">运动相关</a>
                            </li>
                            <li>
                                <a href="">美食相关</a>
                            </li>
                            <li>
                                <a href="">学习相关</a>
                            </li>
                            <li>
                                <a href="">恋爱相关</a>
                            </li>
                            <li>
                                <a href="">旅行相关</a>
                            </li>


                        </ul>


                    </div>
                </div>
            </div>


            <div class="col-lg-12 col-md-12 col-sm-0 col-xs-0">
                <p>热门文章栏</p>
                <div class="text-hot">
                    <p>
                        <span class="badge top1">1</span><a href="">和平精英胜利之战</a>
                    </p>
                    <p>
                        <span class="badge top2">2</span><a href="">和平精英胜利之战</a>
                    </p>
                    <p>
                        <span class="badge top3">3</span><a href="">和平精英胜利之战</a>
                    </p>

                </div>

            </div>

        </div>

        <div class="col-lg-8 col-md-8 col-sm-8 col-xs-12 text-main">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 visit-article">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12 text-title">
                            <h3><a href="">文章标题1111111111111111111111111111111111111111111111111111111111111111111111111111111111</a></h3>
                        </div>
                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-0 text-time hidden-xs">
                            <span class="day">06</span>
                            <div class="monthandyear">
                                <div class="month">02月</div>
                                <div class="year">2020年</div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-content">
                    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 content-pic">
                        <a href=""><img src="photos/sport1.png" class="img-responsive center-block"> </a>
                        <div class="sparkle"></div>
                    </div>
                    <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 content-text">
                        <div class="mytext">
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
                    </div>
                </div>
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <a class="text-readnow" href="">立即阅读</a>
                </div>
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-footer">
                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 footer-category">
                        <span class="glyphicon glyphicon-tags"></span>
                        <span class="label label-default">运动</span>
                        <span class="label label-primary">学习</span>
                        <span class="label label-success">旅行</span>
                        <span class="label label-info">运动</span>
                        <span class="label label-warning">美食</span>
                        <span class="label label-danger">恋爱</span>
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 footer-message">
                        <span class="glyphicon glyphicon-comment" aria-hidden="true"><small class="message-number">111</small> </span>
                        <span class="glyphicon glyphicon-eye-open" aria-hidden="true"><small class="visited-number">111</small></span>
                        <span class="glyphicon glyphicon-heart" aria-hidden="true"><small class="like-number">111</small></span>
                    </div>
                </div>
            </div>
        </div>
        <button class="btn btn-default totitle" style="position:fixed;bottom:10%;right:10%;font-size:12px;padding:0;"><a href="#totitle"> <span
                class="glyphicon glyphicon-menu-up"></span><br>返回顶部</a>
        </button>
    </div>
</template>

<script>
    export default {
        name:"text-main"
    }
</script>