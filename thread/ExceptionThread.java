package thread;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

public class ExceptionThread implements Runnable
{
    @Override
    public void run() {
        Thread t = Thread.currentThread();
        System.out.println("task eh = " + t.getUncaughtExceptionHandler());
        throw new RuntimeException("686");
    }

    public static void main(String[] args) {
        //全局默认处理器。或者在Thread对象上单独设置
        Thread.setDefaultUncaughtExceptionHandler(new MyUncaughtExceptionHandler());
        ExecutorService service = Executors.newCachedThreadPool(new HandlerThreadFactory());
        service.execute(new ExceptionThread());
        service.shutdown();//不执行这一句，会多打印出一条thread对象的输出。
    }
}
