/*!
 * 返回顶部页面脚JAVASCRIPT本文件 
 * create by 邹峰立 on 2017-6-11
 */
window.onload = function() {
	var backupBtn = document.getElementById("btn_backup");
	// 获取页面可视区域的高度
	var clientHeight = document.documentElement.clientHeight;
	var timer = null;
	var isTop = true;

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
};