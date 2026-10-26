# 仓库维护与版本发布

仓库：[yis2014/zzu-journal-latex](https://github.com/yis2014/zzu-journal-latex)。
项目名称：郑州大学学报（工学版）LaTeX 模板。它是非官方实现，适用于课程论文与排版学习。

同学使用模板时，请从仓库首页选择 **Use this template** 或 **Code → Download ZIP**，
并按照 [README](../README.md) 修改和编译。下面的步骤供仓库维护者更新版本时参考。

## 更新源码

```sh
git clone https://github.com/yis2014/zzu-journal-latex.git
cd zzu-journal-latex
# 修改源码或说明后先编译并检查所有页面
latexmk -xelatex main.tex
git status
git add .
git commit -m "Update template and documentation"
git push origin main
```

提交前检查 `git diff --cached`，确认不包含姓名、学号等个人作业信息、官方 Word 附件、
字体文件或构建日志。修改预览示例后，应同步生成 `docs/preview.pdf` 和 `docs/preview.png`，
检查图表、公式、引用和末页英文信息，并更新 `docs/release-verification.json` 中的记录与源码校验值。

## 仓库首页

- About 简介写明郑州大学学报（工学版）、非官方 LaTeX 模板、XeLaTeX、双栏及课程论文用途。
- Topics 使用与实际功能有关的词，如 `latex`、`latex-template`、`xelatex`、`ctex`、`zzu`、
  `zhengzhou-university`、`chinese-typesetting`、`journal-template`、`coursework`、`course-report` 和 `overleaf`。
- 在 Settings → General 开启 **Template repository**，方便同学创建自己的工程。
- README 的首段、编译方法和预览应与当前源码一致；新增功能经过验证后再补入说明。

## 发布版本

1. 更新根目录 [RELEASE_NOTES.md](../RELEASE_NOTES.md)。
2. 在仓库 Releases 页面选择 **Draft a new release**，创建对应版本标签，如首版 `v1.0.0`。
3. 填写版本说明；如附源码 ZIP，检查包内只有公开源码和预览，目录层级正确。
4. 可附上 `docs/preview.pdf`，确认后点击 **Publish release**。

GitHub 也会为每个标签提供源码 ZIP；课程需要固定排版版本时，可记录所用标签或提交号。
自主内容采用 MIT 许可证，贡献者声明保留在 LICENSE 与相关源码中；第三方内容范围见 [NOTICE](../NOTICE.md)。

参考：[GitHub 模板仓库](https://docs.github.com/en/repositories/creating-and-managing-repositories/creating-a-template-repository)、
[仓库 Topics](https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/customizing-your-repository/classifying-your-repository-with-topics)、
[发布版本](https://docs.github.com/en/repositories/releasing-projects-on-github/managing-releases-in-a-repository)。
