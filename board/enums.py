from typing import Type


class ProfileType:
    PERSON = 0
    ORGANIZATION = 1


class ReactionType:
    LIKE = 0
    SURPRISED = 1
    FUNNY = 2


class TagLevel:
    VERB = 1
    OBJECT = 2
    CONDITION = 3


def mk_choices(clz: Type):
    r = [(v, k) for k, v in clz.__dict__.items() if not k.startswith('_')]
    return r
