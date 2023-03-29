package com.weh.community.utils;

import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;
import java.util.stream.Collectors;

public class Result<T> {
    private String code;//返回的状态码
    private String msg;//返回的信息
    private T data;//T表示泛型，表示返回的数据


    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }

    public Result() {
    }

    public Result(T data) {
        this.data = data;
    }

    public static Result success() {
        Result result = new Result<>();
        result.setCode("200");
        result.setMsg("操作成功");
        return result;
    }

    public static <T> Result<T> success(T data) {
        Result<T> result = new Result<>(data);
        result.setCode("200");
        result.setMsg("操作成功");
        return result;
    }

    public static Result error(String code, String msg) {
        Result result = new Result();
        result.setCode(code);
        result.setMsg(msg);
        return result;
    }
    public static Result success(String code, String msg) {
        Result result = new Result();
        result.setCode(code);
        result.setMsg(msg);
        return result;
    }
    public static <T> Result<T> success(String code, String msg, T data) {
        Result<T> result = new Result<>(data);
        result.setCode(code);
        result.setMsg(msg);
        return result;
    }

    /**
     * 将Map集合转为实体对象
     * @param map Map集合
     * @param t 转换后的对象
     * @param considerThread true:考虑现成安全，false：不考虑
     * @return
     * @throws Exception
     */
    public T mapToObject(Map map, Class<T> t, Boolean considerThread) throws Exception {
        Class<?> clazz = null;
        if (considerThread) {
            //通过类装载器获取t类对象
            ClassLoader loader = Thread.currentThread().getContextClassLoader();
            clazz = loader.loadClass(Class.forName(t.getName()).getName());
        } else {
            clazz = Class.forName(Class.forName(t.getName()).getName());
        }
        //获取类的默认构造器对象并通过它实例化t
        Constructor cons = clazz.getDeclaredConstructor((Class[]) null);
        T t1 = (T) cons.newInstance();
        // 获取t对象的所有属性
        Field[] fields = clazz.getDeclaredFields();
        // 将t对象中属性保存为Map的key值，数据类型保存为value值
        Map<String, Object> fieldMap = Arrays.stream(fields).collect(Collectors.toMap(Field::getName, Field::getType));
        // 取出map集合中的全部数据
        Class<?> finalClazz = clazz;
        map.forEach((k, v) -> {
            try {
                // 给当前属性赋值，本来数据类型应该fieldMap.get(k).getClass()这样写。但是上面获取t对象的数据类型时Field::getType这种方法应用不能再获取getName()属性，所以这里是class java.lang.String的类型了，不能再点getClass()了。     所有强转了一下。(Class) fieldMap.get(k)
                Method setBrand = finalClazz.getMethod(initcap(String.valueOf(k)), (Class) fieldMap.get(k));
                setBrand.invoke(t1, v);
            } catch (Exception e) {
                System.out.println("map集合转数组异常："+t.getClass());
            }
        });
        return t1;
    }

    /***
     * 将对象属性转为set方法名
     * @param str 转大写的字符串
     * @return
     */
    public static String initcap(String str) {
        return "set" + str.substring(0, 1).toUpperCase() + str.substring(1) ;
    }

    public static Map<String, Object> ObjectToMapUtil(Object obj)throws  Exception{
        Map<String,Object> reMap = new HashMap<String,Object>();
        Field[] fields = obj.getClass().getDeclaredFields();
        for(int i = 0; i < fields.length; i++){
            Field subField = obj.getClass().getDeclaredField(fields[i].getName());
            subField.setAccessible(true);
            Object o = subField.get(i);
            reMap.put(fields[i].getName(), o);
           }
        return reMap;
    }

    public static Map<String, Object> objectToMap(Object object){
        Map<String,Object> resultMap = new HashMap<>();
        Class<?> clazz = object.getClass();
        Field [] fields = clazz.getDeclaredFields();
        for (Field field : fields) {
            try {
                field.setAccessible(true);
                Object val = field.get(object);
                if (null == val) {
                    continue;
                }
                resultMap.put(field.getName(), val);
            } catch (IllegalArgumentException e) {
                e.printStackTrace();
            } catch (IllegalAccessException  e) {
                e.printStackTrace();
            }
        }
        return resultMap;
    }
}
