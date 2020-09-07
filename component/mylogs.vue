<template id="mylogs">
    <div class="row text-main">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 visit-article" v-for="item,index in loglist">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12 text-title">
                        <h3><a href="">{{item.title}}</a></h3>
                    </div>
                    <div class="col-lg-3 col-md-3 col-sm-3 col-xs-0 text-time hidden-xs">
                        <span class="day">{{item.date.slice(-3,-1)}}</span>
                        <div class="monthandyear">
                            <div class="month">{{item.date.slice(6,7)}}月</div>
                            <div class="year">{{item.date.slice(0,4)}}年</div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-content">
                    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 content-pic">
                        <a href=""><img :src="item.logimgs[0].imgsrc" class="img-responsive center-block"> </a>
                        <div class="sparkle"></div>
                    </div>
                    <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 content-text">
                        <div class="mytext">
                            {{item.text}}
                            <!--    实验要求：每1s输出一次最新RTC时间。定时把RTC时间存入到FLASH中，当系统重新启动后，能够恢复FLASH中的RTC时间，继续进行计时。
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
                                {-->
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <a class="text-readnow" href="" @click.prevent.stop="readnow(index)">立即阅读</a>
                </div>
            </div>

            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-footer">
                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 footer-category">
                        <span class="glyphicon glyphicon-tags"></span>
                        <span v-for="item,index in item.category"
                              :class="cateclasstype[item.cateID]">{{item.catename}}</span>
                        <!--<span class="label label-default" >运动</span>
                            <span class="label label-primary">学习</span>
                            <span class="label label-success">旅行</span>
                            <span class="label label-info">运动</span>
                            <span class="label label-warning">美食</span>
                            <span class="label label-danger">恋爱</span>-->
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 footer-message">
                        <span class="glyphicon glyphicon-comment" aria-hidden="true"><small class="message">{{item.num_message}}</small> </span>
                        <span class="glyphicon glyphicon-eye-open" aria-hidden="true"><small class="visited">{{item.num_visited}}</small></span>
                        <span class="glyphicon glyphicon-thumbs-up" aria-hidden="true"><small class="like">{{item.num_like}}</small></span>

                    </div>
                </div>
            </div>
        </div>
    </div>
</template>
<script>
    export default {
        data() {
            return {
                mylogsnum: 4,
                cateclasstype: {
                    '1': "label label-default",
                    '2': "label label-primary",
                    "3": "label label-success",
                    "4": "label label-info",
                    "5": "label label-warning",
                    "6": "label label-danger"
                },
                loglist: [{
                    userID: "userid",
                    textID: "textID",
                    title: "the title of one logs",
                    text: "this is test text",
                    username: 'frenchcai',
                    date: "2020年02月23日",
                    logimgs: [
                        {
                            userID: "userID", textID: "textID", imgsrc: "./1111.pmg"
                        }
                    ],
                    category: [
                        {cateID: "1", catename: "运动"}
                    ],
                    num_message: 2,
                    num_visited: 3,
                    num_like: 5,
                    message: [{
                        "userID": "1223",
                        "username": "一旬",
                        "message": "加油啊",

                    }]
                }]
            }
        },
        methods: {
            created() {
                //异步请求数据
                /*    axios.post('./queryTextByUser',
                        'username=' +this.GLOBAL.user.username,
                        // 参数 lastName
                    ).then(response => this.mylogslist=response.data)
                        .catch(function (error) { // 请求失败处理
                            console.log("查找文章失败啦，在query方法上出错啦");
                        })
                    */
            },
            //readnow可以是一个全局函数
            readnow(index) {
                //在跳转之前，需要对全局的presentlog数据进行渲染
                this.GLOBAL.presentlog = this.loglist[index]
                this.GLOBAL.loginstatus = 1
                console.log("123",this.GLOBAL.presentlog,this.GLOBAL.loginstatus);
                //window.location.href = 'text-main.html?textID=' + this.loglist[index].textID

            }
        }
    }
</script>