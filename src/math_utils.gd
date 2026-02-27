class_name MathUtils
extends RefCounted


static func add(a: float, b: float) -> float:
	return a + b


static func safe_divide(numerator: float, denominator: float) -> float:
	if is_zero_approx(denominator):
		return 0.0
	return numerator / denominator
