package org.course.management.entity;import com.fasterxml.jackson.annotation.JsonIgnore;import com.fasterxml.jackson.annotation.JsonIgnoreProperties;import jakarta.persistence.*;import lombok.AllArgsConstructor;import lombok.Getter;import lombok.NoArgsConstructor;import lombok.Setter;import java.sql.Date;import java.util.List;@Getter@Setter@AllArgsConstructor@NoArgsConstructor@Entity@Table(name = "cm_course")public class Course {    @Id    @GeneratedValue(strategy = GenerationType.IDENTITY)    @Column(name = "course_id")    private int courseId;    @Column(name = "course_name", columnDefinition = "nvarchar(255)")    private String courseName;    @Column(name = "creation_date")    private Date creationDate;    @Column(name = "course_image")    private String courseImage;    @Column(name = "about", columnDefinition = "nvarchar(1000)")    public String about;    @Column(name = "video_url")    public String videoURL;    @Column(name = "video_duration")    public String videoDuration;    @ManyToOne(fetch = FetchType.LAZY, cascade = {CascadeType.PERSIST, CascadeType.MERGE})    @JoinColumn(name = "topic_id")    @JsonIgnoreProperties(value = {"applications", "hibernateLazyInitializer"})    private Topic topic;    @OneToMany(mappedBy = "course")    @JsonIgnore    private List<CourseDetail> courseDetails;    @OneToMany(mappedBy = "course")    @JsonIgnore    private List<Enroll> enrolls;    @OneToMany(mappedBy = "course")    @JsonIgnore    private List<Rate> rates;}