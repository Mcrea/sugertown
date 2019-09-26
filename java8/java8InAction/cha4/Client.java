package java8.cha4;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

public class Client {
    public static void main(String[] args) {
        List<Dish> menu = fillDishList();
        Stream<Dish> dishStream = menu.stream();
        //以下2个终端操作只能执行一个。不然stream has already been operated upon or closed
//        List<String> threeHighCaloricDishNames =
//                dishStream.filter(d -> {
//                    System.out.println("filter:"+d.getName());
//                    return d.getCalories() > 300;})
//                .map(Dish::getName)
//                .limit(3)
//                .collect(Collectors.toList());
//        System.out.println(threeHighCaloricDishNames);
        //可以在操作中修改元素的属性，从而影响数据源。
        dishStream.forEach(d -> {
            d.setName("Test");});
        System.out.println(menu.get(0).getName());
    }
    public static List<Dish> fillDishList()
    {
        List<Dish> menu = Arrays.asList(
                new Dish("pork", false, 800, Dish.Type.MEAT),
                new Dish("beef", false, 700, Dish.Type.MEAT),
                new Dish("chicken", false, 400, Dish.Type.MEAT),
                new Dish("french fries", true, 400, Dish.Type.MEAT),
                new Dish("french fries", true, 530, Dish.Type.OTHER),
                new Dish("rice", true, 350, Dish.Type.OTHER),
                new Dish("season fruit", true, 120, Dish.Type.OTHER),
                new Dish("pizza", true, 550, Dish.Type.OTHER),
                new Dish("prawns", false, 300, Dish.Type.FISH),
                new Dish("salmon", false, 450, Dish.Type.FISH) );
        return menu;
    }
}
