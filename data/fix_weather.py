def fix_date(bad):
    try:
        d,m,y = [f'{int(i):02}' for i in bad.split('-')]
        return f'{y}-{m}-{d}'
    except ValueError as ve:
        print(f'>>>>>>>>{bad}<<<<<<<')
        raise ve

with(open('weather_data.raw')) as input:
    with(open('weather_data.csv', 'w')) as output:
        for idx, line in enumerate(input):
            if idx == 0:
                output.write(line)
                continue
            parts = line.split(',')
            date = [fix_date(parts[0])]
            date += parts[1:]
            output.write(",".join(date))
