package java8.cha1;

import java.util.List;

public class Client {

    public static void main(String[] args) {
        List<Apple> appleList = Apple.fillAppleList();
        List<Apple> filterColorApples = Apple.filterApples(appleList, Apple::isGreenApple);
        System.out.println(filterColorApples);
        List<Apple> filterHeavyApples = Apple.filterApples(appleList, Apple::isHeavyApple);
        System.out.println(filterHeavyApples);
//        List<Apple> filterLightApples = Apple.filterApples(appleList, Apple::isLightApple);非静态方法不可行
//        System.out.println(filterLightApples);
        //lambda
        List<Apple> filterWeightApples = Apple.filterApples(appleList, (Apple a) -> a.getWeight() <150);
        System.out.println(filterWeightApples);
        List<Apple> filterWeightApples2 = Apple.filterApplesByStream(appleList, (Apple a) -> a.getWeight() <250);
        System.out.println(filterWeightApples2);
    }
}
