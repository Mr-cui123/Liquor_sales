package school.czm.entity;

public class Catelog {
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_catelog.catelog_id
     *
     * @mbggenerated Sun Dec 15 16:29:07 CST 2019
     */
    private Integer catelogId;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_catelog.catelog_name
     *
     * @mbggenerated Sun Dec 15 16:29:07 CST 2019
     */
    private String catelogName;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_catelog.catelog_miaoshu
     *
     * @mbggenerated Sun Dec 15 16:29:07 CST 2019
     */
    private String catelogMiaoshu;


    @Override
    public String toString() {
        return "Catelog{" +
                "catelogId=" + catelogId +
                ", catelogName='" + catelogName + '\'' +
                ", catelogMiaoshu='" + catelogMiaoshu + '\'' +
                '}';
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_catelog.catelog_id
     *
     * @return the value of t_catelog.catelog_id
     *
     * @mbggenerated Sun Dec 15 16:29:07 CST 2019
     */
    public Integer getCatelogId() {
        return catelogId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_catelog.catelog_id
     *
     * @param catelogId the value for t_catelog.catelog_id
     *
     * @mbggenerated Sun Dec 15 16:29:07 CST 2019
     */
    public void setCatelogId(Integer catelogId) {
        this.catelogId = catelogId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_catelog.catelog_name
     *
     * @return the value of t_catelog.catelog_name
     *
     * @mbggenerated Sun Dec 15 16:29:07 CST 2019
     */
    public String getCatelogName() {
        return catelogName;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_catelog.catelog_name
     *
     * @param catelogName the value for t_catelog.catelog_name
     *
     * @mbggenerated Sun Dec 15 16:29:07 CST 2019
     */
    public void setCatelogName(String catelogName) {
        this.catelogName = catelogName == null ? null : catelogName.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_catelog.catelog_miaoshu
     *
     * @return the value of t_catelog.catelog_miaoshu
     *
     * @mbggenerated Sun Dec 15 16:29:07 CST 2019
     */
    public String getCatelogMiaoshu() {
        return catelogMiaoshu;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_catelog.catelog_miaoshu
     *
     * @param catelogMiaoshu the value for t_catelog.catelog_miaoshu
     *
     * @mbggenerated Sun Dec 15 16:29:07 CST 2019
     */
    public void setCatelogMiaoshu(String catelogMiaoshu) {
        this.catelogMiaoshu = catelogMiaoshu == null ? null : catelogMiaoshu.trim();
    }
}