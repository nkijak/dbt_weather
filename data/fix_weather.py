def fix_date(bad):
    try:
        parts = [f'{int(i):02}' for i in bad.split('-')]
        return f'{parts[2]}-{parts[1]}-{parts[0]}'
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
