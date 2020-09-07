<template id="myattention">
    <div class="row list-group">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 myconcern">
            <a href="" class="list-group-item active">我的关注</a>
            <div class="list-group-item">
                <h4 class="list-group-item-heading">
                    你关注的小伙伴都在这呢
                </h4>
                <h4 v-for="item,index in friendlist">
                    <a @click='toFriendDetail(index)'>
                        {{item.username}}
                    </a>
                    <button style='float:right;' type='button' class='btn btn-danger btn-sm'
                            @click='cancelAttention(index)'><span class='glyphicon glyphicon-remove'></span>取消关注
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
                friendsnum: 6,
                friendlist: [],

            }
        },
        methods: {
            created() {
                //异步请求数据
                /*    axios.post('./queryAllFriends',
                        'userID=' +this.GLOBAL.user.userID
                        // 参数 this.GLOBAL.user是全局变量
                    )
                        .then(response => {this.friendlist=response.data.friendlist;this.friendsnum=data.num})
                        .catch(function (error) { // 请求失败处理
                            console.log("查找文章失败啦，在query方法上出错啦");
                        })
    */
            }
        }
    }
</script>