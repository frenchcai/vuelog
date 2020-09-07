<template id="mycollect">
    <div class="row list-group">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 mylike">
            <a href="" class="list-group-item active">我的收藏</a>
            <div class="list-group-item">
                <h4 class="list-group-item-heading">
                    你喜欢的都在这呢
                </h4>
                <h4 v-for="item,index in loglist">
                    <a @click='toTextDetail(index)'>
                        {{item.title}}
                    </a>
                    <button style='float:right;' type='button' class='btn btn-danger btn-sm'
                            @click='cancelLike(index)'><span class='glyphicon glyphicon-remove'></span>取消收藏
                    </button>
                </h4>
            </div>
        </div>
    </div>
</template>
<script>
export default {
    data() {
        return {
            userID: "",
            //useriD暂时不管，要使用全局的变量user
            logsnum: 1,
            loglist: [
                {
                    userID: "userid",
                    textID: "textID",
                    title: "the title of one logs",
                    text: "这个是实例文本",
                    username: 'frenchcai',
                    date: "2020年02月23日",
                    logimgs: [],
                    category: [{cateID: "1", catename: "运动"}],
                    num_message: 2,
                    num_visited: 3,
                    num_like: 5,
                    message: [{}]
                }
            ]
        }
    },
    methods: {
        created() {
            /*   axios.post('/jietao/queryAllTextServlet',
                   'userID=' +this.GLOBAL.user.userID
                   // 参数 this.GLOBAL.user是全局变量
               )
                   .then(response => this.loglist=response.data)
                   .catch(function (error) { // 请求失败处理
                       console.log("查找文章失败啦，在query方法上出错啦");
                   })
*/
        },
        readnow(index) {
            //在跳转之前，需要对全局的presentlog数据进行渲染
            this.GLOBAL.presentlog = this.loglist[index]
            console.log("123");
            window.location.href = 'text-main.html?textID=' + this.loglist[index].textID
        }
    }
}



</script>