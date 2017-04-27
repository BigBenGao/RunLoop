# RunLoop
RunLoop加载大图
原作者 https://github.com/diwu/RunLoopWorkDistribution

通过注册观察者监听RunLoop即将进入休眠时的状态kCFRunLoopBeforeWaiting进行回调加载大图任务，并且保证每次RunLoop的执行只加载一次。
通过这种方式能够使得在大图加载过程中，滑动过程依然流畅。
