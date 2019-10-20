package thread;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;

public class TaskWithResult implements Callable<String>
{
    private int id;
    private int max;
    public TaskWithResult(int id, int max)
    {
        this.id = id;
        this.max = max;
    }
    @Override
    public String call() throws Exception
    {
        long sum = 0;
        long[] arr = new long[max];
        for (int i = 0;i < this.max;i++)
        {
            if (i <= 1)
            {
                arr[i] = 1;
            }
            else
            {
                arr[i] = arr[i - 1] + arr[i - 2];
            }
            sum += arr[i];
        }
        return "" + sum;
    }

    public static void main(String[] args) throws Exception {
        ExecutorService service = Executors.newCachedThreadPool();
        List<Future<String>> fsList = new ArrayList<Future<String>>();
        for (int i = 0;i < 10;i++)
        {
            Future<String> fs = service.submit(new TaskWithResult(i, 10 * i));
            fsList.add(fs);
        }
        for (Future<String> fs : fsList)
        {
            System.out.println(fs.get());
        }

    }

}
