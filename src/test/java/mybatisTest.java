
import cn.ssm.entity.User;
import cn.ssm.service.UserService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.ArrayList;
import java.util.List;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath*:application*.xml"})
public class mybatisTest {
    @Autowired
    private UserService userService;

    @Test
    public void testMybatisSpring() throws Exception {
        List<User> users = userService.findAll();
        for (int i = 0; i < users.size(); i++) {
            User user = users.get(i);
            System.out.println(user);
        }
    }

    public static void main(String[] args) {
        List<User> user=new ArrayList<>();
    }
}


