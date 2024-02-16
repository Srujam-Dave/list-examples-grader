import static org.junit.Assert.*;
import org.junit.*;
import java.util.Arrays;
import java.util.List;
import java.util.ArrayList;

class IsMoon implements StringChecker {
  public boolean checkString(String s) {
    return s.equalsIgnoreCase("moon");
  }
}

class StringCheckerTest implements StringChecker {
  public boolean checkString(String s) {
    return true;
  }
}
public class TestListExamples {
  @Test(timeout = 500)
  public void testMergeRightEnd() {
    List<String> left = Arrays.asList("a", "b", "c");
    List<String> right = Arrays.asList("a", "d");
    List<String> merged = ListExamples.merge(left, right);
    List<String> expected = Arrays.asList("a", "a", "b", "c", "d");
    assertEquals(expected, merged);
  }

  @Test
  public void testStringChecker() {

    ArrayList<String> outputList = new ArrayList<String>();
    outputList.add("moon");

    ArrayList<String> inputList = new ArrayList<String>();
    inputList.add("moon");
    inputList.add("hi");

    assertEquals(outputList, ListExamples.filter(inputList, new IsMoon()));
  }
}
