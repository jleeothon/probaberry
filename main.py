import locale

from math import factorial as f


nice = lambda: locale.format("%d", _, grouping=True)

__all__ = (
    'f',
    'nice',
)



"""
# draft

PROBABERRY_LOCALE = 'en'

try:
    locale.setlocale(locale.LC_ALL, PROBABERRY_LOCALE)
except:
    pass

def nicify_integer(n):
    s = ''
    while n > 0:
        s = str(n % 1000) + s
        n /= 1000
    return s


def nice():
    try:
        return locale.format("%d", _, grouping=True)
    except:
        if isinstance(_) in (int, long):
            return nicify_integer(_)
        return _
        
        

"""
