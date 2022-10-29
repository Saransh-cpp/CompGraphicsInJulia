from manim import *
import numpy as np


class Translate(ThreeDScene):
    def construct(self):
        axes = ThreeDAxes()
        c = Cube(1)

        self.play(Create(axes))
        self.move_camera(phi=75 * DEGREES, theta=-45 * DEGREES)
        self.play(Create(c))
        self.play(c.animate.move_to(2 * RIGHT))
        self.play(c.animate.move_to(4 * LEFT))
        self.play(c.animate.move_to(ORIGIN))
        self.play(c.animate.move_to(UP))
        self.play(c.animate.move_to(2 * DOWN))
        self.play(c.animate.move_to(ORIGIN))
        self.play(c.animate.set_z(-1))
        self.play(c.animate.set_z(1))
        self.play(c.animate.move_to(ORIGIN))


class Scale(ThreeDScene):
    def construct(self):
        axes = ThreeDAxes()
        l1 = Line(np.array([1, 1, 1]), np.array([-1, -1, -1]))
        l2 = Line(np.array([2, 3, 1]), np.array([-2, -3, -1]))

        self.play(Create(axes))
        self.move_camera(phi=75 * DEGREES, theta=-45 * DEGREES)
        self.play(Create(l1))
        self.play(Transform(l1, l2))


class Rotate(ThreeDScene):
    def construct(self):
        axes = ThreeDAxes()
        d1 = Sphere(radius=0.2).move_to(RIGHT)
        d2 = Sphere(radius=0.2).move_to(
            (1 / np.sqrt(2)) * RIGHT + (1 / np.sqrt(2)) * UP
        )
        d3 = (
            Sphere(radius=0.2)
            .move_to((1 / np.sqrt(2)) * 0.5 * RIGHT + (1 / np.sqrt(2)) * UP)
            .set_z((1 / np.sqrt(2)) * (np.sqrt(3) / 2))
        )

        self.play(Create(axes))
        self.play(Create(d1))
        self.play(
            ReplacementTransform(
                d1,
                d2,
                path_func=utils.paths.path_along_arc(PI / 4),
                run_time=2,
            )
        )
        self.move_camera(phi=75 * DEGREES, theta=-45 * DEGREES)
        self.play(
            Transform(
                d2,
                d3,
                # path_func=utils.paths.path_along_arc(PI / 3),
                run_time=2,
            )
        )
