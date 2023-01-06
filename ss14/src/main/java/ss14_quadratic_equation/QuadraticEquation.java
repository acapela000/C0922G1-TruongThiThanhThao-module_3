package ss14_quadratic_equation;

public class QuadraticEquation {

    public static void quadratic(int a, int b, int c) {
        double x1, x2;
        double delta = (b * b) - (4 * a * c);
        if (delta < 0) {
            System.out.println("The equation has no solution");
        } else if (delta == 0) {
            x1 = x2 = -b / (2 * a);
            System.out.println("x1 và x2 =" + x1);
        } else {
            x1 = (-b - Math.sqrt(delta)) / 2 * a;
            x2 = (-b + Math.sqrt(delta)) / 2 * a;
            System.out.println("x1 " + x1 + " and " + " x2 " + x2);
        }
    }

}
