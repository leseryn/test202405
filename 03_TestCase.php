<?php

namespace Tests\Feature;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;

class ExampleTest extends TestCase
{

    /**
     * 授課講師所開課程列表 - 指定講師
     *
     * @return void
     */
    public function test_course_lecturer_get()
    {
        $response = $this->get('/course/lecturer/2');
        $data = [
            ['id' => 2],
            ['id' => 5],
            ['id' => 8],
        ];
        $response->assertStatus(200);
        $response->assertJson($data, $strict = false);
    }

    /**
     * 測試建立課程 - 成功建立並可查詢
     *
     * @return void
     */
    public function test_course_post()
    {
        $data = [
            "name" => "Academic Writing",
            "abstract" => "In this course, the students will learn how to develop academic arguments, conducting textual or cultural analysis to support these arguments, and develop a clear and elegant writing style. The students are expected to improve their writing skills through interactive activities such as class discussions and peer review.",
            "semesterId" => 1,
            "classDay" => "Mon",
            "startTime" => "1400",
            "endTime" => "1600",
            "credit" => 2,
            "lecturerId" => 1,
        ];
        
        $response = $this->postJson('/course', $data);
        $id = $response->getContent()['id'];
        $responseGet = $this->get('/course/'.$id );
        $data = [
            "name" => "Academic Writing",
            "abstract" => "In this course, the students will learn how to develop academic arguments, conducting textual or cultural analysis to support these arguments, and develop a clear and elegant writing style. The students are expected to improve their writing skills through interactive activities such as class discussions and peer review.",
            "semester" => "202301",
            "classDay" => "Mon",
            "startTime" => "1400",
            "endTime" => "1600",
            "credit" => 2,
            "lecturer" => "John Doe",
        ];
        $responseGet->assertJson($data, $strict = false);
    }

    /**
     * 測試更新課程內容 - 課程id不存在
     *
     * @return void
     */
    public function test_course_put()
    {
        $data = [
            "name" => "TEST PUT",
            "abstract" => "TEST PUT",
        ];
        $response = $this->putJson('/course/3333', $data);
        $response->assertStatus(404);
    }

}
