<!--template发在根元素外面的-->
<template id="middlemain">
    <div class="col-lg-10 col-lg-offset-1 col-md-10 col-md-offset-1 col-sm-12 col-xs-12 main">
        <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 nav-left">
            <ul class="list-group">
                <li v-for="item,index in leftlist" :class="item.liclass"><a :href="item.href" :class="item.aclass" @click.prevent.stop="toMy(item.href)">{{item.name}}</a>
                </li>
            </ul>
        </div>
        <div class="col-lg-10 col-md-10 col-sm-10 col-xs-10 main-right">
            <!--我的收藏页面-->
            <component :is="comid"></component>
            <!--我的文章页面-->
            <!--我的关注页面-->
        </div>
    </div>
</template>

<script>
    import mycollect from "./mycollected";
    import myattention from "./myattention";
    import mylogs from "./mylogs";

    export default {
        props: ["user"],
        data() {
            return {
                leftlist: [
                    {liclass: "nav-left-liitem", aclass: "small", href: "aboutme/mycollect", name: "我的收藏"},
                    {liclass: "nav-left-liitem", aclass: "small", href: "aboutme/mylogs", name: "我的文章"},
                    {liclass: "nav-left-liitem", aclass: "small", href: "aboutme/myattention", name: "我的关注"},
                    {liclass: "nav-left-liitem", aclass: "small", href: "aboutme/logout", name: "退出登录"},
                ],
                comid: "myattention",
            }
        },
        methods: {
            toMy(href) {
                console.log(href, href.split("/")[1])
                this.comid = href.split("/")[1]
            }
        },
        components: {mycollect, mylogs, myattention}
    }

</script>

<style scoped>
    body {
        background-color: rgba(245, 246, 247, 0.5);
    }

    .text-main-navgation {
        position: fixed;
        top: 0;
        left: 0;
        right: 0;
        z-index: 66;
    }

    .main-right {
        background-color: white;
        z-index: 8;
    }
</style>