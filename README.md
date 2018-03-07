# ZBackUpWeb
JavaScript实现返回顶部功能。使用工具MyEclipse 2014
>作者：邹峰立，微博：zrunker，邮箱：zrunker@yahoo.com，微信公众号：书客创作，个人平台：[www.ibooker.cc](http://www.ibooker.cc)。

>本文选自[书客创作](http://www.ibooker.cc)平台第53篇文章。[阅读原文](http://www.ibooker.cc/article/53/detail) 。

![书客创作](http://upload-images.jianshu.io/upload_images/3480018-2f8108bcd40fda31..jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

现今网站基本上使用到返回顶部这一个功能，它们实现的方式也大同小异。实现的方法也非常多，但是每一种实现方式都是不同的，征对性也不同，下面通过三个案例来说说这一功能的实现。

**案例1：锚链接，#id**
```
<a href="#id" target="_self">返回顶部</a>
```
锚链接是实现同一个页面间的定位，如果页面要定位到哪个位置，只需要将#id设置成定位布局的id，那么要返回顶部的功能，只需要把#id改成顶部布局（如div）的id即可，也可以直接设置成#（如果直接设置#会重新加载该页面，所以使用要谨慎）。

锚链接适用于页面布局间导航，不合适实现返回顶部功能。

**案例2：窗体直接向上滚动到顶部。**
```
// 实现返回顶部功能标签a
<a class="go-top" href="javascript:;"></a>
// jQuery实现 返回顶部
$('.go-top').bind('click', function() { $(window).scrollTop(0); });
```
这种方法实现起来也非常简单，使用jQuery给超链接a标签绑定点击事件，通过$(window).scrollTop(0);将整个窗体快速的滚动到距离顶部为0的位置来达到返回顶部效果，这种方法滚动到顶部的速度非常快，几乎是瞬变。

注意：1、href="javascript:;"取消超链接访问，执行javascript方法，这里的方法为空所以不执行，或者使用href="javascript:void(0);"代替。

2、$('.go-top').bind('click', function() { // 实现逻辑});这是jQuery绑定事件的方法，click为点击，function(){}为回调方法。

**案例3：也是本次所要实现最终目标。**

先看一下本案例实现的效果是什么样：仔细看页面右下角的图标变化，观察效果。

![返回顶部效果图](http://upload-images.jianshu.io/upload_images/3480018-f51e07a37aa5918b..gif?imageMogr2/auto-orient/strip)

效果1：当页面加载完成之后，返回顶部图标未显示，但是当向下滚动一定的距离之后，返回顶部图标显示出来，要实现这一效果我们要对窗体滚动事件进行监听window.onscroll。
效果2：点击返回顶部图标，页面会以匀减速的方式向上滚动，视觉效果会好很多，要实现匀减速我们要用到setInterval定时器。

**实现：在这里采用javascript，实现案例3。**
```
<a id="btn_backup" class="right_fixed_backup" href="javascript:;"></a>
```
同样是通过a标签实现，至于如何实现固定在页面右侧，这里只需要使用position:fixed固定定位即可。

步骤1、首先要在页面加载完成之后就马上实现窗体滚动事件监听和对标签a点击监听，使用javascript提供的window.onload()方法实现。在该方法中我们不仅仅要实现窗体滚动事件监听和对标签a点击监听，还要实现全局变量的定义，如定时器timer。
```
window.onload = function() {
    // 获取返回按钮
    var backupBtn = document.getElementById("btn_backup");
    // 获取页面可视区域的高度
    var clientHeight = document.documentElement.clientHeight;
    var timer = null;// 定义定时器变量
    var isTop = true;// 是否返回顶部
    // 滚动滚动条时候触发
    window.onscroll = function() {
        // 实现逻辑
    };
    // 返回顶部按钮点击事件
    backupBtn.onclick = function() {
        // 实现逻辑
    };
};
```
步骤2、我们要在窗体滚动事件监听里面实现对返回顶部图片的显示和隐藏，这里采用的是如果滚动的高度大于窗口的可视区域的高度时显示，否则隐藏。
```
// 获取页面可视区域的高度
var clientHeight = document.documentElement.clientHeight;
// 滚动滚动条触发
window.onscroll = function() {
    // 获取滚动条到顶部高度-返回顶部显示或者隐藏
    var osTop = document.documentElement.scrollTop || document.body.scrollTop;
    if (osTop >= clientHeight) {
        backupBtn.style.display = "block";
    } else {
        backupBtn.style.display = "none";
    }
    // 如果是用户触发滚动条就取消定时器
    if (!isTop) {
        clearInterval(timer);
    }
    isTop = false;
};
```
这里有两个特别小心的地方：

（1）、var osTop = document.documentElement.scrollTop || document.body.scrollTop;获取滚动条到顶部高度，这里是为了兼容不同的浏览器，所以要这样写。

（2）、clearInterval(timer);该方法实现取消定时器，我们要在页面返回到顶部的时候，要及时取消定时器。

步骤3、我们要在返回顶部图标按钮点击的时候触发定时器。
```
backupBtn.onclick = function() {
    // 设置定时器
    timer = setInterval(
        function() {
            // 获取滚动条到顶部高度
            var osTop = document.documentElement.scrollTop || document.body.scrollTop;
            var distance = Math.floor(-osTop / 6);
            document.documentElement.scrollTop = document.body.scrollTop = osTop + distance;
            isTop = true;
            if (osTop == 0) {
                clearInterval(timer);
            }
    }, 30);
};
```
这里通过滚动条到顶部的距离document.documentElement.scrollTop = document.body.scrollTop = osTop + distance;来改变页面对顶部的距离。

注意：var distance = Math.floor(-osTop / 6);这是获取每次要移动的距离，因为是向上移动所以要取负值-，并且要通过Math.floor()该方法是向下取整，如果不调用Math.floor()方法，-osTop / 6将永远都不接近于0，这样会导致滚动条会一直在滚动。当页面滚到到页面顶部的时候要及时关闭定时器。

[Github地址](https://github.com/zrunker/ZBackUpWeb)
[阅读原文](http://www.ibooker.cc/article/53/detail) 

----------
![微信公众号：书客创作](http://upload-images.jianshu.io/upload_images/3480018-6625e5b469d73c13..jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
