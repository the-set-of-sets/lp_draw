// lp_draw.asy
// Sara Fish, July 6 2019

/* L_p Drawing Library
- ball: draws L_p ball. Now only works with integer p because of precision issues.
*/ 

unitsize(1cm);
import contour;


void ball(pair center, real radius, int p, pen color=gray(0))
{
    real f1(real x, real y) {return (x-center.x)^p + (y-center.y)^p - radius; }
    real f2(real x, real y) {return (x-center.x)^p + (center.y - y)^p - radius; }
    real f3(real x, real y) {return (center.x - x)^p + (y-center.y)^p - radius; }
    real f4(real x, real y) {return (center.x - x)^p + (center.y - y)^p - radius; }
    pair bottom_left = center - (radius, radius);
    pair upper_right = center + (radius, radius);
    guide[][] g1 = contour(f1, bottom_left, upper_right, new real[] {0});
    guide[][] g2 = contour(f2, bottom_left, upper_right, new real[] {0});
    guide[][] g3 = contour(f3, bottom_left, upper_right, new real[] {0});
    guide[][] g4 = contour(f4, bottom_left, upper_right, new real[] {0});
    draw(g1[0], color);
    draw(g2[0], color);
    draw(g3[0], color);
    draw(g4[0], color);
}
