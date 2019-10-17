import java.util.HashMap;
import java.util.Map;

class SuffixTree {
    public static class Node {
        String path;
        Node[] children;

        Node(String path) {
            this.path = path;
            this.children = new Node[64];
        }
    }

    public static Node buildSuffixTree(Node root) {
        // String string = "abxabcx$";
        String string = "zxabcdezy$yzabcdezx#";
        System.out.println(string);
        
        String[] alphabet = new String[] { "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "a", "b", "c", "d", "e",
                "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z",
                "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U",
                "V", "W", "X", "Y", "Z", "$", "#", };

        Map<String, Integer> map = new HashMap<String, Integer>();
        for (int i = 0; i < alphabet.length; i++) {
            map.put(alphabet[i], i);
        }

        for (int i = 0; i < string.length(); i++) {
            for (int j = 0; j <= i; j++) {

                System.out.println("substring: " + string.substring(j, i));

                String substring = string.substring(j, i);
                String nextChar = string.substring(i, i + 1);

                Node current = root;
                Integer pos = 0;
                Integer l = 0;

                while (l < substring.length()) {
                    Node child = current.children[map.get(substring.substring(l,l+1))];
                    if (child != null) { 
                        current = child;
                        pos = 0;
                    } else {
                        break;
                    }
                    
                    Integer c = 0;
                    while (c < current.path.length() && l < substring.length()) {
                        if (current.path.charAt(c) == substring.charAt(l)) {
                            c++;
                            l++;
                            pos++;
                        } else {
                            break;
                        }
                    }
                }
// I'm not checking the scenario when the substring has reached the end of the 
// The node's path, but one of the children continues the path. 
                if (substring.length() == 0) {
                    if (current.children[map.get(nextChar)] == null)
                        current.children[map.get(nextChar)] = new Node(nextChar);
                } else if (pos == current.path.length() && hasNoChildren(current)) {
                    current.path += nextChar;
                } else if (pos == current.path.length() && current.children[map.get(nextChar)] == null) {
                    current.children[map.get(nextChar)] = new Node(nextChar);
                } else if (pos != current.path.length() && !current.path.substring(pos, pos+1).equals(nextChar)) {
                    current.children[map.get(nextChar)] = new Node(nextChar);

                    Node newNode = new Node(current.path.substring(pos, current.path.length()));
                    current.path = current.path.substring(0, pos);
                    current.children[map.get(newNode.path.substring(0,1))] = newNode;
                }

                for (int m = 0; m < root.children.length; m++) {
                    if (root.children[m] != null)
                        System.out.println(root.children[m].path);
                }
            }
        }

        return root;
    }

    public static boolean hasNoChildren(Node rood) {
        for (int i = 0; i < rood.children.length; i++) {
            if (rood.children[i] != null) return false;
        }
        return true;
    }

    public static void printSuffixes(Node node, String suffix) {
        int count = 0;
        for (int i = 0; i < node.children.length; i++) {
            if (node.children[i] != null) {
                printSuffixes(node.children[i], suffix + node.children[i].path);
                count++;
            }
        }
        if (count == 0)
            System.out.println(suffix);
    }
    public static void main(String[] args) {
        Node root = new Node("");
        buildSuffixTree(root);
        // Test
        printSuffixes(root, "");
    }
}
