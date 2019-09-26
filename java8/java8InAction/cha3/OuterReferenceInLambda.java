package java8.cha3;

import java8.cha1.Apple;

import java.util.function.Consumer;

public class OuterReferenceInLambda {
    private String name;
    private int age;
    private Apple apple;
    public OuterReferenceInLambda(String name, int age, Apple apple)
    {
        this.name = name;
        this.age = age;
        this.apple = apple;
    }
    public void OutReferenceTest()
    {
        int a = 100;
        Apple apple = new Apple("white", 150);
        //局部变量不能在lambda表达式中改变:"局部基本类型变量：" + i*++a or apple = new Apple("pink", 200);
        Consumer<Integer> consumer = (i) ->
        {
            apple.setWeight(200);
//            apple = new Apple("pink", 200);//非基本类型也不允许修改引用，但是可以修改变量的属性
            System.out.println("局部非基本类型变量：" + apple);
            System.out.println("局部基本类型变量：" + i*a);
        };
        consumer.accept(5);
        //对于外部类的变量，lambda貌似具有完全的使用权
        Consumer<Integer> consumer2 = (i) ->
        {
            this.apple = new Apple("green", 300);
            System.out.println("外部类基本类型变量：" + i*++age);
            System.out.println("外部类非基本类型变量：" + this.apple);
        };
        consumer2.accept(5);
        System.out.println(this.apple);

    }
}
