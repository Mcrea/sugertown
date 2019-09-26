package java8.cha5;

import java8.cha4.Dish;

import java.nio.charset.Charset;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.*;
import java.util.stream.IntStream;
import java.util.stream.Stream;

import static java.util.Arrays.*;
import static java.util.stream.Collectors.toList;
import static java8.cha4.Client.fillDishList;

public class Client {
    public static void main(String[] args) {
        List<Dish> menu = fillDishList();
        //筛选filter，接受一个谓词作为参数Predicate，返回所有符合谓词的元素
        menu.stream().filter(d -> d.isVegetarian())
                .map(d -> d.getName())
                .distinct()//distinct方法会对流中的元素执行equals方法，确定没有重复的元素
                //.limit(5)//这个方法会截断当前流，只返回不超过n个元素的流。返回的元素取决于原始流是否有序,这里存疑。n大于元素个数，返回整个流。
                .skip(5)//这个方法会截断当前流，跳过前n个元素，明显和limit方法互补。如果同时使用，返回空流。n大于元素个数，也会返回空流
                .forEach(d -> System.out.println(d));
        Set<Integer> numSet = new HashSet<Integer>();
        numSet.add(2);
        numSet.add(5);
        numSet.add(1);
        numSet.add(4);
        numSet.add(3);
        numSet.stream().limit(4).forEach(d -> System.out.println(d));
        numSet.stream().map(i -> "today is day " + i)
                .forEach(s -> System.out.println(s));
        Integer sum = numSet.stream().reduce(0, Integer::min);
        System.out.println(sum);

        String[] str = {"hello", "world"};
        //boolean bool =
        Optional<String> finds =
                stream(str)
                .map(s -> s.split(""))//这里的元素是字符串数组
                .flatMap(Arrays::stream)//将每个元素转化为流之后通过flatMap方法合并到一起
                .distinct().findFirst();
                //.allMatch(s -> "q".equals(s));//因为是终端操作，所以注释forEach
                //.forEach(s -> System.out.print(s));
        //System.out.println(bool);
        System.out.println(finds.get());


        List<Integer> nums1 = Arrays.asList(1, 2, 3);
        List<Integer> nums2 = Arrays.asList(3, 4);
        Integer[] nums3 = {5, 6};//注意int和Integer的区别
        stream(nums3).map(j -> new int[]{j}).forEach(i -> System.out.println(i));
        List<int[]> result = nums1.stream().flatMap(i -> nums2.stream().map(j -> new int[]{i, j}))
                .collect(toList());
        System.out.println(result);

        //自动装拆箱妥妥的
        int sum5 =  menu.stream()
                .map(d -> d.getCalories())//装箱
                .reduce(0, (a, b) -> a + b);//拆箱，体现在加号上
        System.out.println(sum5);
        //用IntStream爽爽
        int sum6 =  menu.stream()
                .mapToInt(d -> d.getCalories())//返回IntStream，而且lambda的返回值是int
                .sum();//IntStream提供的方法。
        System.out.println(sum6);
        //Optional对象特化
        OptionalInt sum7 =  menu.stream()
                .mapToInt(d -> d.getCalories())
                .max();
        System.out.println(sum7);
        //range和rangeClosed构建数值流
        IntStream is = IntStream.rangeClosed(1, 100);
        int sum8 = is.sum();
        System.out.println(sum8);

        //生成勾股数
        IntStream.rangeClosed(1, 100).boxed()
                .flatMap(a -> IntStream.rangeClosed(a, 100)
                        .mapToObj(b -> new double[]{a, b, Math.sqrt(a*a+b*b)}))
                .filter(t -> t[2]%1 == 0)
                .limit(5)
                .forEach(ia -> System.out.println(ia[0] + " " + ia[1] + " " + ia[2]));

        //由文件生成流Files.lines，但是读不到文件是个问题
        try (Stream<String> lines = Files.lines(Paths.get("cha5/chapinfo.txt"), Charset.defaultCharset())){
            lines.forEach(s -> System.out.println(s));
        }catch(Exception e){
            System.out.println("oha : " + e.toString());
        }

        //无限流1
        Stream.iterate(0, n -> n + 2)
                .limit(20)
                .forEach(i -> System.out.println(i));
        //生成斐波那契数列
        Stream.iterate(new int[]{0, 1}, ia -> new int[]{ia[1], ia[0]+ia[1]})
                .map(ia -> ia[0])
                .limit(20)
                .forEach(i -> System.out.println(i));

        //每次都是Supplier提供的值
        Stream.generate(() -> 1)
                .limit(10)//无限流必须加limit
                .forEach(i -> System.out.println(i));

    }
}
