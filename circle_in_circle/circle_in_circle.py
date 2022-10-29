from manim import *


class OuterCircle(Scene):
    def construct(self):
        c1 = Circle()
        c2 = Circle().move_to(2 * RIGHT)
        self.add(NumberPlane())
        self.play(Create(c1))
        self.play(Create(c2))
        self.wait(2)
        self.play(MoveAlongPath(c2, Circle(2)), run_time=2, rate_func=linear)


class InnerCircle(Scene):
    def construct(self):
        c1 = Circle(2)
        c2 = Circle().move_to(RIGHT)
        self.add(NumberPlane())
        self.play(Create(c1))
        self.play(Create(c2))
        self.wait(2)
        self.play(MoveAlongPath(c2, Circle()), run_time=2, rate_func=linear)
