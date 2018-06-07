package;

import massive.munit.Assert;
import com.blakwurm.djala.*;

class FooTest {
    @Test
    public function fTest() {
        Assert.areEqual(1, 1);
    }

    @Test
    public function bTest() : Void {
      Assert.isNotNull(Bar.foo);
    }
}
