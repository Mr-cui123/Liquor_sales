package school.czm.entity;

public class Admin {
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_admin.userid
     *
     * @mbggenerated Wed Dec 18 14:31:12 CST 2019
     */
    private Integer userid;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_admin.username
     *
     * @mbggenerated Wed Dec 18 14:31:12 CST 2019
     */
    private String username;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_admin.userpwd
     *
     * @mbggenerated Wed Dec 18 14:31:12 CST 2019
     */
    private String userpwd;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_admin.userid
     *
     * @return the value of t_admin.userid
     *
     * @mbggenerated Wed Dec 18 14:31:12 CST 2019
     */
    public Integer getUserid() {
        return userid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_admin.userid
     *
     * @param userid the value for t_admin.userid
     *
     * @mbggenerated Wed Dec 18 14:31:12 CST 2019
     */
    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_admin.username
     *
     * @return the value of t_admin.username
     *
     * @mbggenerated Wed Dec 18 14:31:12 CST 2019
     */
    public String getUsername() {
        return username;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_admin.username
     *
     * @param username the value for t_admin.username
     *
     * @mbggenerated Wed Dec 18 14:31:12 CST 2019
     */
    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_admin.userpwd
     *
     * @return the value of t_admin.userpwd
     *
     * @mbggenerated Wed Dec 18 14:31:12 CST 2019
     */
    public String getUserpwd() {
        return userpwd;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_admin.userpwd
     *
     * @param userpwd the value for t_admin.userpwd
     *
     * @mbggenerated Wed Dec 18 14:31:12 CST 2019
     */
    public void setUserpwd(String userpwd) {
        this.userpwd = userpwd == null ? null : userpwd.trim();
    }
}