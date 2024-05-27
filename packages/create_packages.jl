using PkgTemplates


t = Template(;
    user="curenosm",
    license="MIT",
    authors="curenosm",
    plugins=[
        TravisCI(),
        Codecov(),
        Coveralls(),
        AppVeyor(),
    ],
)

generate("MyExample", t)