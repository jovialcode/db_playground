package playground.web.dto;

import com.playground.web.dto.HelloDto;
import org.junit.Test;

public class HelloDtoTest {

    @Test
    public void 롬복_테스트(){
        String name = "test";
        int amount = 1000;

        HelloDto dto = new HelloDto(name, amount);

        assert(dto.getName()).equals(name);
    }
}
