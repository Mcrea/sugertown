package javaio;

import java.io.*;

public class ClassicIOGuide {
    //读文件
    public static String readFile(String filePath){
        BufferedReader bufferedReader = null;
        try {
            bufferedReader = new BufferedReader(new FileReader(filePath));
            String string;
            StringBuilder stringBuilder = new StringBuilder("");
            while ((string = bufferedReader.readLine()) != null){
                stringBuilder.append(string + "\n");
            }
            bufferedReader.close();
            return stringBuilder.toString();
        } catch (IOException e){
            e.printStackTrace();
        } finally {
            if (bufferedReader != null){
                try {
                    bufferedReader.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        return null;
    }
    public static void writeFile(String filePath, String context) throws IOException{
        PrintWriter printWriter = null;
        try {
            FileWriter fileWriter = new FileWriter(filePath);
            BufferedWriter bufferedWriter = new BufferedWriter(fileWriter);
            printWriter = new PrintWriter(bufferedWriter);
//            printWriter = new PrintWriter(filePath);//可代替上三行。仍然具有缓存能力。
            //printWriter.append(context);//无法append
            printWriter.println(context);
            printWriter.flush();
            printWriter.close();
        } finally {
            if (printWriter != null){
                printWriter.close();
            }
        }
    }
    public static void saveData2File(String filePath) throws IOException{
        //输出到文件后，文件不可视
        DataOutputStream dataOutputStream = null;
        DataInputStream dataInputStream = null;
        try {
            dataOutputStream = new DataOutputStream(new BufferedOutputStream(new FileOutputStream(filePath)));
            dataOutputStream.writeChar('a');
            dataOutputStream.writeBoolean(false);
            dataOutputStream.writeDouble(1.2345);
            dataOutputStream.writeInt(6);
            dataOutputStream.flush();
            dataOutputStream.close();
            //读写顺序必须完全一致
            dataInputStream = new DataInputStream(new BufferedInputStream(new FileInputStream(filePath)));
            System.out.println(dataInputStream.readChar());
            System.out.println(dataInputStream.readBoolean());
            System.out.println(dataInputStream.readDouble());
            System.out.println(dataInputStream.readInt());
        } finally {
            if (dataOutputStream != null){
                dataOutputStream.close();
            }
            if (dataInputStream != null){
                dataInputStream.close();
            }
        }
    }


    public static void main(String[] args) throws Exception{
        String fileContext = ClassicIOGuide.readFile("./src/javaio/booknote.txt");
        System.out.println(fileContext);
        //从内存中读数据
        StringReader stringReader = new StringReader(fileContext);
//        int c;
//        try {
//            while ((c = stringReader.read()) != -1){
//                System.out.print((char)c);//这里可以输出中文，说明char支持Unicode。而且不会丢失回车
//            }
//        } catch (IOException e){
//            e.printStackTrace();
//        }
        //当然，也可以用bufferedReader增强StringReader的能力。注意，当执行上面时，下面的代码不会输出任何。
        BufferedReader bufferedReader = new BufferedReader(stringReader);
        howToBufferedReader(bufferedReader);
        //当数据格式化为字节数组时，可以使用DataInputStream读取。DataInputStream是装饰器，ByteArrayInputStream是基本数据源IO
        ByteArrayInputStream byteArrayInputStream = new ByteArrayInputStream(fileContext.getBytes());
        DataInputStream dataInputStream = new DataInputStream(byteArrayInputStream);
        //这一段会输出乱码，我的处理如下.然后我感觉DataInputStream存在的意义应该不是像下面这样用的。
//        while (dataInputStream.available() != 0){
//            System.out.println((char)dataInputStream.readByte());
//        }
        InputStreamReader inputStreamReader = new InputStreamReader(byteArrayInputStream);
        BufferedReader bufferedReader1 = new BufferedReader(inputStreamReader);
        howToBufferedReader(bufferedReader1);

        //writeFile("./src/javaio/booknote.txt", "你好");
        saveData2File("./src/javaio/Data.txt");
    }
    private static void howToBufferedReader(BufferedReader bufferedReader) throws Exception{
        try {
            String s = null;
            StringBuilder stringBuilder = new StringBuilder("");
            while ((s = bufferedReader.readLine()) != null){
                stringBuilder.append(s).append("\n");
            }
            bufferedReader.close();
            System.out.println(stringBuilder.toString());
        } finally {
            if (bufferedReader != null){
                bufferedReader.close();
            }
        }
    }
}
