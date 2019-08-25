package com.study.mybatis;

import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

/**
 * Hello world!
 *
 */
public class App 
{
    public static void main( String[] args ) throws Exception
    {
    	selectOne();
    }
    static void selectOne() throws Exception
    {
    	// 指定全局配置文件
        String resource = "mybatis-config.xml";
        // 读取配置文件
        InputStream inputStream = Resources.getResourceAsStream(resource);
        // 构建sqlSessionFactory
        SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
        
        
        // 获取sqlSession
        SqlSession sqlSession = sqlSessionFactory.openSession();
        // 操作CRUD，第一个参数：指定statement，规则：命名空间+“.”+statementId
        // 第二个参数：指定传入sql的参数：这里是用户id
        VoiceLog vLog = sqlSession.selectOne("logMapper.selectLog", 28);
        System.out.println(vLog);
        sqlSession.close();
    }
    static void insertLog() throws Exception
    {
    	// 指定全局配置文件
        String resource = "mybatis-config.xml";
        // 读取配置文件
        InputStream inputStream = Resources.getResourceAsStream(resource);
        // 构建sqlSessionFactory
        SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
        
        
        // 获取sqlSession
        SqlSession sqlSession = sqlSessionFactory.openSession();
        sqlSession.insert("logMapper.insertLog", new VoiceLog("大王", "大王要我来巡山"));
        sqlSession.commit();
        sqlSession.close();
    }
}
