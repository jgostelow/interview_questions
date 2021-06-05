class Solution {
  int[] numList = { 1,4,5,9,10,40,50,90,100,400,500,900,1000 };
  String[] romanList = { "I", "IV", "V", "IX", "X", "XL", "L", "XC", "C", "CD", "D", "CM", "M"};

  public String toRoman(int start) {
    int remainder = start;
    String roman = "";
    for(int i = numList.length-1; i >= 0; i--) {
      while(remainder >= numList[i]) {
        roman += romanList[i];
        remainder -= numList[i];
      }
    }
    return roman;
  }

  public static void runTest(int input, String expected_result) {
    String result = new Solution().toRoman(input);
    String testOutcome = expected_result.equals(result)
      ? "PASS"
      : "FAIL --- actual: " + result;
    System.out.println(input + " => " + expected_result + " : " + testOutcome);
  }

  public static void main(String[] args) {
    runTest(49, "XLIX");
    runTest(492, "CDXCII");
    runTest(3611, "MMMDCXI");
    runTest(4000, "MMMM");
    runTest(0, "");
    runTest(-1, "");
  }
}
