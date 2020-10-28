import com.alibaba.druid.pool.DruidDataSource;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.xt.entity.Emp;
import com.xt.mapper.EmpMapper;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.sql.SQLException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class MyTest {

    ApplicationContext context = new ClassPathXmlApplicationContext("spring.xml");

    @Test
    public void test01() throws SQLException {
        DruidDataSource dataSource = context.getBean("dataSource", DruidDataSource.class);
        System.out.println(dataSource.getConnection());
    }

    private EmpMapper empDao = context.getBean(EmpMapper.class);

    @Test
    public void testInsert(){
        Emp emp = new Emp();
        emp.setEName("zhangsan");
        emp.setJob("Teacher");
        emp.setMgr(100);
        emp.setSal(1000.0);
        emp.setComm(500.0);
        emp.setHiredate(new Date());
        emp.setDeptno(10);
        int insert = empDao.insert(emp);
        System.out.println(insert);
        System.out.println(emp.getEmpno());
    }

    @Test
    public void testUpdate(){
        Emp emp = new Emp();
        emp.setEmpno(1);
        emp.setEName("lisi");
        emp.setJob("student");
        emp.setMgr(100);
        emp.setSal(1000.0);
        emp.setComm(500.0);
        emp.setHiredate(new Date());
        emp.setDeptno(10);
        int update = empDao.updateById(emp);
        System.out.println(update);
    }

    @Test
    public void testDelete(){
        // 1、根据id删除数据
//        int i = empDao.deleteById(1);
//        System.out.println(i);

        // 2、根据一组id删除数据
//        int i = empDao.deleteBatchIds(Arrays.asList(2, 3, 4));
//        System.out.println(i);

        // 3、根据条件删除数据
//        QueryWrapper queryWrapper = new QueryWrapper();
//        queryWrapper.in("empno",Arrays.asList(5,6,7));
//        int delete = empDao.delete(queryWrapper);
//        System.out.println(delete);

        // 4、条件封装map删除数据
        Map<String,Object> map = new HashMap<>();
        map.put("empno", 9);
        int i = empDao.deleteByMap(map);
        System.out.println(i);
    }

    @Test
    public void testselect(){

        // 1、根据id查询对象
//        Emp emp = empDao.selectById(1);
//        System.out.println(emp);

        // 2、根据实体包装类查询单个对象，返回的结果集有且仅能有一个对象
//        QueryWrapper<Emp> emp = new QueryWrapper<Emp>();
//        emp.eq("empno",2).eq("e_name","zhangsan");
//        Emp emp1 = empDao.selectOne(emp);
//        System.out.println(emp1);

        // 3、通过多个id值进行查询
//        List<Emp> list = empDao.selectBatchIds(Arrays.asList(1, 2, 3));
//        for (Emp emp : list) {
//            System.out.println(emp);
//        }

        // 4、通过map封装进行条件查询
//        Map<String,Object> map = new HashMap<String, Object>();
//        map.put("e_name","zhangsan");
//        map.put("sal",1000.0);
//        List<Emp> list = empDao.selectByMap(map);
//        for (Emp emp : list) {
//            System.out.println(emp);
//        }

        // 5、分页查询,需要添加分页插件
        /**
         * <property name="plugins">
         *             <array>
         *                 <bean class="com.baomidou.mybatisplus.extension.plugins.PaginationInterceptor"></bean>
         *             </array>
         *         </property>
         */

         Page<Emp> empPage = empDao.selectPage(new Page<>(1, 2), null);
         List<Emp> records = empPage.getRecords();
         System.out.println(records);

        // 6、根据条件返回查询结果总数
//        QueryWrapper<Emp> queryWrapper = new QueryWrapper<>();
//        queryWrapper.eq("e_name","zhangsan");
//        Integer integer = empDao.selectCount(queryWrapper);
//        System.out.println(integer);

        // 7、根据条件查询所有结果返回list集合
//        List<Emp> list = empDao.selectList(null);
//        for (Emp emp : list) {
//            System.out.println(emp);
//        }

        // 8、根据条件查询结果封装成map的list结构
//        List<Map<String, Object>> maps = empDao.selectMaps(null);
//        System.out.println(maps);
    }

    @Test
    public void TestPage(){
        Page page = new Page(2,2);
        Page page1 = empDao.selectPage(page, null);
        List records = page1.getRecords();
        for (Object record : records) {
            System.out.println(record);
        }
        System.out.println("==============");
        System.out.println("获取总条数：" + page.getTotal());
        System.out.println("当前页码：" + page.getCurrent());
        System.out.println("总页码：" + page.getPages());
        System.out.println("每页显示的条数：" + page.getSize());
        System.out.println("是否有上一页：" + page.hasPrevious());
        System.out.println("是否有下一页：" + page.hasNext());
    }

    @Test
    public void testOptimisticLocker(){
        Emp emp = new Emp();
        emp.setEmpno(2);
        emp.setEName("zhang");
        emp.setSal(10000.0);
        emp.setComm(1000.0);
        emp.setVersion(1);
        empDao.updateById(emp);
    }

    @Test
    public void testSqlExplain(){
        int delete = empDao.delete(null);
        System.out.println(delete);
    }

    @Test
    public void testSqlIllegal(){
        QueryWrapper<Emp> queryWrapper = new QueryWrapper<>();
        queryWrapper.or();
        List<Emp> list = empDao.selectList(queryWrapper);
        for (Emp emp : list) {
            System.out.println(emp);
        }
    }

    @Test
    public void testMeta(){
        int insert = empDao.insert(new Emp());
        System.out.println(insert);
    }
}