package java8.cha3;

import java8.cha1.Apple;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.List;
import java.util.function.BiFunction;
import java.util.function.IntPredicate;
import java.util.function.Predicate;
import java.util.function.Supplier;

public class Client {
    public static void main(String[] args) throws Exception{
        //测试
//        test(() -> "hello java8");
//        processRunnable();
//        Predicate p = jdkFuncIntf((String s) -> s.length() > 2);
//        System.out.println(p.test("123"));
        //异常处理
//        processFile((BufferedReader br) -> {throw new RuntimeException();});// runtimeException不需要抽象方法throws异常
//        processFile((BufferedReader br) -> br.readLine());//checked exception需要抽象方法throws异常
        //参数类型推断
        //局部变量，必须带具体的类型
//        Predicate<Apple> pred = (a) -> a.getWeight() > 100;
        //函数式接口参数，如果参数是泛型的话的不ok的
//        argTypeInference((a) -> a.getWeight() > 100);

        //操作外部作用域的变量
//        OuterReferenceInLambda out = new OuterReferenceInLambda("Alex", 27, new Apple("yellow", 100));
//        out.OutReferenceTest();

        //静态方法
        methodReference(Apple::isGreenApple, new Apple("yellow", 100));
        //对象方法的调用，以入参作为对象本身
        methodReference(Apple::isLightApple2, new Apple("yellow", 200));

        //对象服务方法的调用，处理入参（其他对象）。
        Apple apple2 = new Apple("blue", 500);
        methodReference(apple2::isLightApple, new Apple("yellow", 100));
        //构造函数
        //可以先把lambda表达式写出来，再转换成合适的函数式接口，没那么抽象。
        BiFunction<String, Integer, Apple> supplier = Apple::new;
        Apple apple3 = supplier.apply("pink", 900);
        System.out.println(apple3);
        //复合操作，连续执行多个行为
        String color = supplier.andThen((apple) -> apple.getColor()).apply("white", 200);
        System.out.println(color);
        Predicate<Apple> pred = Apple::isGreenApple;
        pred.negate().test(apple3);
        System.out.println(pred.negate().test(apple3));

    }
    static <T> void methodReference(Predicate<T> predicate, T t)
    {
        System.out.println(predicate.test(t));
    }
    static void argTypeInference(Predicate<Apple> pred)
    {
        List<Apple> apples = Apple.fillAppleList();
        for (int i = 0;i < apples.size();i++)
        {
            System.out.println(pred.test(apples.get(i)));
        }
    }
//    static <T> Predicate<T> getLambda(T t)
//    {
//        return t -> t.getClass();
//    }
    static Predicate jdkFuncIntf(Predicate<String> predicate)
    {
        return predicate.and((String s) ->!s.isEmpty());
    }
    static void processFile(BufferedReaderProcessor brp) throws IOException {
        //相对路径读不到？
        try (BufferedReader br = new BufferedReader(new FileReader("/home/mjluoxue/文档/IdeaProjects/thinkInJ/src/java8/cha3/chapinfo.txt"))){
            System.out.println(brp.process(br));
        }
    }
    static void processRunnable()
    {
        Runnable run1 = () -> System.out.println("run1 is running!");
        Runnable run2 = new Runnable() {
            @Override
            public void run() {
                System.out.println("run2 is running!");
            }
        };
        process(run1);
        process(run2);
        process(() -> System.out.println("run3 is running!"));
    }
    static void process(Runnable runnable)
    {
        runnable.run();
    }
    static void test(FuncIntf ei)
    {
        System.out.println(ei.say());
    }
}
