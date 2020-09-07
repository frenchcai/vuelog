import aboutsite from "./aboutsite";
import aboutme from "./aboutme";
import show from "./show";
import textdetail from "./text-detail"
import textmain from "./text-main"
import textwrite from "./text-write"
//全局组件——顶部导航栏
Vue.component("top-narbar", {
    template: "<div class=\"text-main-navgation\">\n" +
        "    <div class=\"col-lg-12 col-md-12 col-sm-12 col-xs-12\" style=\"padding:0;\">\n" +
        "        <div class=\"col-lg-1 col-md-1 col-sm-3 col-xs-0 logo hidden-xs\">\n" +
        "            <a href=\"index.html\"><img src=\"photos/logo3.png\" class=\"img-responsive center-block\" alt=\"Responsive image\"></a>\n" +
        "        </div>\n" +
        "        <div class=\"col-lg-11 col-md-11 col-sm-9 col-xs-12 navegation\" style=\"padding:0;\">\n" +
        "            <button type=\"button\" class=\"navbar-toggle collapsed minimenu\" data-toggle=\"collapse\"\n" +
        "                    data-target=\"#bs-example-navbar-collapse-1\" aria-expanded=\"false\">\n" +
        "\n" +
        "                菜单\n" +
        "            </button>\n" +
        "\n" +
        "            <!-- Collect the nav links, forms, and other content for toggling -->\n" +
        "            <div class=\"collapse navbar-collapse\" id=\"bs-example-navbar-collapse-1\">\n" +
        "                <ul class=\"nav navbar-nav\">\n" +
        "                    <li v-for='item,index in narlist'><a :href=item.href  ref='nara'>{{item.name}}</a></li>\n" +
        /*    "                    <li><a href=\"index.html\" @click.stop='toNowpage' ref='a'>首页</a></li>\n" +
            "                    <li><a href=\"text-write.html\" @click='toNowpage' ref='a'>记录美好</a></li>\n" +
            "                    <li><a href=\"text-main.html\" @click='toNowpage' ref='a'>发现故事</a></li>\n" +
            "                    <li><a href=\"aboutsite.html\" @click='toNowpage'>关于本站</a></li>\n" +*/
        "                    <li class=\"dropdown\">\n" +
        "                        <a href=\"aboutme.html\" class=\"dropdown-toggle\" data-toggle=\"dropdown\" role=\"button\" aria-haspopup=\"true\"\n" +
        "                           aria-expanded=\"false\" id=\"nowpage\" :class='{active:isActive}'>我的<span class=\"caret\"></span></a>\n" +
        "                        <ul class=\"dropdown-menu\">\n" +
        "                            <li v-for='item,index in ablist'><a :href=item.href @click.prevent.stop='toNowpage(index)' ref='a'>{{item.name}}</a></li>\n" +
        "                        </ul>\n" +
        "                    </li>\n" +
        "                </ul>\n" +
        "\n" +
        "            </div>\n" +
        "        </div>\n" +
        "    </div>\n" +
        "\n" +
        "</div>",
    data() {
        return {
            msg: "xiaoxi",
            isActive: true,
            narlist: [
                {href: "index.html", name: "首页"},
                {href: "text-write.html", name: "记录美好"},
                {href: "text-main.html", name: "发现故事"},
                {href: "aboutsite.html", name: "关于本站"},
            ],

            ablist: [
                {href: "aboutme/login", name: "登录/注册"},
                {href: "aboutme/collect", name: "我的收藏"},
                {href: "aboutme/logs", name: "我的文章"},
                {href: "aboutme/attention", name: "我的关注"}
            ],

        }
    },
    methods: {
        toNowpage(index) {
            console.log(this.$refs.a[index].href);
        }
    }
})
//在Vue的原型链上创建一个全局对象，保存用户的信息和即将访问文章的信息，减少数据库的压力，其vue实例后代的都可以找到并且使用这个对象
Vue.prototype.GLOBAL = {}
//以下为测试数据，真实数据要事件触发后进行重新赋值
Vue.prototype.GLOBAL.presentlog = {
    userID: "2017254142",
    textID: "textID",
    title: "the title of one logs",
    username: 'frenchcai',
    date: "2020年02月23日",
    logimgs: [{userID: "userID", textID: "textID", imgsrc: "./photos/bg1.png"}],
    category: [{cateID: "1", catename: "运动"}],
    num_message: 2,
    num_visited: 3,
    num_like: 5,
    message: [{
        "userID": "1223",
        "username": "一旬",
        "message": "加油啊",
    }]
}
Vue.prototype.GLOBAL.loginstatus = 0
Vue.prototype.GLOBAL.user = {"userID": "2017254142", "username": "黑旋风"}

//数据已经测试，ok
let vm = new Vue({
    el: "#app",
    data: {
        vel: "show"
    },
    methods: {
        changepage(val) {
            this.vel = val;
        }

    },
    components: {show,textwrite,textmain,textdetail,aboutme,aboutsite}
})
